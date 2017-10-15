import 'dart:async';

import 'package:analyzer/analyzer.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:built_mirrors/built_mirrors.dart';
import 'package:source_gen/source_gen.dart';

/// Generates ClassMirror constants from classes annotated with `@Reflectable()`
class MirrorsGenerator extends GeneratorForAnnotation<Reflectable> {
  const MirrorsGenerator();

  @override
  Future<String> generateForAnnotatedElement(Element element, ConstantReader constantReader,
      BuildStep buildStep) async {
    if (element is FunctionElement) {
      return 'const ${element.name}FunctionMirror = ${_renderFunction(element)};';
    }

    if (element is ClassElement) {
      if (element.isEnum) {
        return "const ${element.name}ClassMirror = const ClassMirror("
            "name: '${element.name}',"
            "isEnum: true,"
            "values: ${element.name}.values);";
      }

      var superTypes = element.allSupertypes.where((st) => st.element.name != 'Object');
      var stAccessors = superTypes.expand((st) => st.accessors);
      var stMethods = superTypes.expand((st) => st.methods);
      var stFields = superTypes.expand((st) => st.element.fields);

      var constructors = element.constructors;
      var className = element.name;
      var fields = _distinctByName(element.fields.toList()
        ..addAll(stFields));
      var accessors = _distinctByName(element.accessors.toList()
        ..addAll(stAccessors));
      var getters = _distinctByName(accessors.where((a) => a.kind == ElementKind.GETTER));
      var setters = _distinctByName(accessors.where((a) => a.kind == ElementKind.SETTER));
      var methods = _distinctByName(element.methods.toList()
        ..addAll(stMethods));

      return '''${element.isAbstract ? '' : constructors.map((c) => '_${className}_${c
          .name}_Constructor([positionalParams, namedParams]) =>'
          'new ${className}${c.name.isEmpty ? '' : '.${c.name}'}(${_renderConstructorParametersCall(c)});\n').join('')}

${element.fields.map(_renderFieldsDeclarations).join('\n')}

const ${className}ClassMirror = const ClassMirror(
  name: '${element.name}',
  ${[
        element.isAbstract ? '' : '''constructors: const {
          ${constructors.map((c) => "'${c.name}': const FunctionMirror("
            "${_renderPositionalParameters(c.parameters)}"
            "${_renderNamedParameters(c.parameters)}"
            "\$call: _${className}_${c.name}_Constructor)").join(',')}
          }''',
        _renderMetadata(element.metadata),
        fields.isNotEmpty ? 'fields: const {${fields.map(_renderFields).join(',')}}' : '',
        getters.isNotEmpty ? 'getters: const [${getters.map((g) => "'${g.name}'").join(',')}]' : '',
        setters.isNotEmpty
            ? 'setters: const [${setters.map((s) => "'${s.name.substring(0, s.name.length - 1)}'").join(',')}]'
            : '',
        methods.isNotEmpty ? 'methods: const {${methods.map(_renderMethods).join(',')}}' : '',
        element.isAbstract ? 'isAbstract: true' : '',
        element.supertype.name != 'Object' ? 'superclass: ${element.supertype}' : '',
        element.interfaces.isNotEmpty ? 'superinterfaces: const [${element.interfaces.join(',')}]' : ''
      ].fold('', _combine)}
);''';
    }
    return null;
  }
}

List<T> _distinctByName<T extends Element>(Iterable<T> elements) {
  var result = <T>[];
  for (var element in elements) {
    if (!result.any((e) => e.name == element.name)) result.add(element);
  }
  return result;
}

String _combine(String pv, String e) =>
    pv.isNotEmpty && e.isNotEmpty ? pv + ',' + e : pv.isEmpty ? e : e.isEmpty ? pv : '';

String _renderConstructorParametersCall(ConstructorElement c) {
  var i = 0;
  return c.parameters.map((p) =>
  p.parameterKind != ParameterKind.NAMED
      ? 'positionalParams[${i++}]'
      : "${p.name}: namedParams['${p.name}']"
  ).join(',');
}

String _renderMethods(MethodElement m) =>
    "'${m.name}': " + _renderFunction(m);

String _renderFunction(ExecutableElement f) =>
    "const FunctionMirror("
        "${_renderPositionalParameters(f.parameters)}"
        "${_renderNamedParameters(f.parameters)}"
        "name: '${f.name}',"
        'returnType: ${_renderType(f.returnType)}'
        + ',' + _renderMetadata(f.metadata) +
        ')';

String _renderNamedParameters(List<ParameterElement> params) {
  var result = params.where((p) => p.parameterKind == ParameterKind.NAMED)
      .map((p) => "'${p.name}': ${_renderParameter(p)}").join(',');
  return result.isEmpty ? '' : 'namedParameters: const {${result}},';
}

String _renderPositionalParameters(List<ParameterElement> params) {
  var result = params.where((p) => p.parameterKind != ParameterKind.NAMED).map(_renderParameter).join(',');
  return result.isEmpty ? '' : 'positionalParameters: const [$result],';
}

String _renderParameter(ParameterElement p) =>
    "const DeclarationMirror("
        "name: '${p.name}',"
        'type: ${_renderType(p.type)}'
        '${p.parameterKind == ParameterKind.REQUIRED ? ', isRequired: true' : ''}'
        '${p.parameterKind == ParameterKind.NAMED ? ', isNamed: true' : ''}'
        '${p.metadata.isEmpty ? '' : ','} ${_renderMetadata(p.metadata)}'
        ')';

String _renderFieldsDeclarations(FieldElement e) =>
    "const \$\$${e.enclosingElement.name}_fields_${e.name} = const DeclarationMirror("
        'type: ${_renderType(e.type)}'
        '${e.isFinal ? ', isFinal: true' : ''}'
        '${e.metadata.isEmpty ? '' : ','} ${_renderMetadata(e.metadata)}'
        ');';

String _renderFields(VariableElement e) =>
    "'${e.name}': \$\$${e.enclosingElement.name}_fields_${e.name}";

String _renderMetadata(List<ElementAnnotation> metadata) {
  var annotations = metadata.where((a) =>
      (a.constantValue.type.element as ClassElement).allSupertypes.any((st) => st.name == 'Annotation'));
  return annotations.isNotEmpty
      ? "annotations: const [${annotations.map((a) =>
  a.element is ConstructorElement
      ? 'const ${a.constantValue.type}${_renderAnnotationParameters(a)}'
      : a.element.name).join(',')}]"
      : '';
}

String _renderAnnotationParameters(ElementAnnotation annotation) {
  return (annotation.element as ConstructorElement).parameters.map((p) =>
  p.parameterKind == ParameterKind.NAMED
      ? '${p.name}: ${_renderParameterValue(p, annotation)}'
      : _renderParameterValue(p, annotation)).toString();
}

String _renderParameterValue(ParameterElement parameter, ElementAnnotation annotation) {
  var thingy = new ConstantReader(annotation.computeConstantValue()).read(parameter.name);
  
  return (thingy?.isNull != false) ? 'null' : _renderValue(thingy.objectValue);
}

String _renderValue(DartObject field) {
  if (field.type is FunctionType) return field.type.element.displayName;

  var cr = new ConstantReader(field);
  if (cr.isString) return "r'${cr.stringValue}'";
  if (cr.isList) {
    return 'const [${cr.listValue.map((v) => _renderValue(v)).join(',')}]';
  }
  if (cr.isMap) {
    var values = [];
    cr.mapValue.forEach((k, v) => values.add("${_renderValue(k)}: ${_renderValue(v)}"));
    return 'const {${values.join(',')}}';
  }
  if (cr.isLiteral) return cr.literalValue.toString();
  if (cr.isType) return cr.typeValue.toString();

  var revived = cr.revive();
  var arguments = revived.positionalArguments.map(_renderValue).toList();
  revived.namedArguments.forEach((k, v) => arguments.add('$k: ${_renderValue(v)}'));
  return 'const ${field.type.displayName}(${arguments.join(',')})';
}


String _renderType(DartType type) =>
    type is ParameterizedType && type.typeArguments.isNotEmpty
        ? 'const [${type.name}, ${_renderTypes(type.typeArguments)}]'
        : type.name != 'void'
          ? type.name
          : 'null';

String _renderTypes(List<DartType> types) =>
    types.length > 1
        ? 'const [${types.map(_renderType).join(',')}]'
        : _renderType(types[0]);
