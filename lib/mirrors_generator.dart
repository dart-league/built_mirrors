import 'dart:async';

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'built_mirrors.dart';
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
        return "const ${element.name}ClassMirror = ClassMirror("
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
          '${className}${c.name.isEmpty ? '' : '.${c.name}'}(${_renderConstructorParametersCall(c)});\n').join('')}

${element.fields.map(_renderFieldsDeclarations).join('\n')}

const ${className}ClassMirror = ClassMirror(
  name: '${element.name}',
  ${[
        element.isAbstract ? '' : '''constructors: {
          ${constructors.map((c) => "'${c.name}': FunctionMirror("
            "name: '${c.name}',"
            "${_renderPositionalParameters(c.parameters)}"
            "${_renderNamedParameters(c.parameters)}"
            "\$call: _${className}_${c.name}_Constructor)").join(',')}
          }''',
        _renderMetadata(element.metadata),
        fields.where((x) => !x.isStatic).isNotEmpty
            ? 'fields: {${fields.where((x) => !x.isStatic).map(_renderFields).join(',')}}'
            : '',
        getters.where((x) => !x.isStatic).isNotEmpty
            ? 'getters: [${getters.where((x) => !x.isStatic).map((g) => "'${_getSerializedNameFromAccessor(g)}'").join(',')}]'
            : '',
        setters.where((x) => !x.isStatic).isNotEmpty
            ? 'setters: [${setters.where((x) => !x.isStatic).map((s) => "'${_getSerializedNameFromAccessor(s)}'").join(',')}]'
            : '',
        methods.where((x) => !x.isStatic).isNotEmpty ? 'methods: {${methods.where((x) => !x.isStatic).map(_renderMethods).join(',')}}' : '',
        element.isAbstract ? 'isAbstract: true' : '',
        element.supertype.name != 'Object' ? 'superclass: ${element.supertype.name}' : '',
        element.interfaces.isNotEmpty ? 'superinterfaces: [${element.interfaces.map((i) => i.name).join(',')}]' : ''
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
  p.isPositional
      ? 'positionalParams[${i++}]'
      : "${p.name}: namedParams['${p.name}']"
  ).join(',');
}

String _renderMethods(MethodElement m) =>
    "'${m.name}': " + _renderFunction(m);

String _renderFunction(ExecutableElement f) =>
    "FunctionMirror("
        "${_renderPositionalParameters(f.parameters)}"
        "${_renderNamedParameters(f.parameters)}"
        "name: '${f.name}',"
        'returnType: ${_renderType(f.returnType)}'
        + ',' + _renderMetadata(f.metadata) +
        ')';

String _renderNamedParameters(List<ParameterElement> params) {
  var result = params.where((p) => p.isNamed)
      .map((p) => "'${p.name}': ${_renderParameter(p)}").join(',');
  return result.isEmpty ? '' : 'namedParameters: {${result}},';
}

String _renderPositionalParameters(List<ParameterElement> params) {
  var result = params.where((p) => p.isPositional).map(_renderParameter).join(',');
  return result.isEmpty ? '' : 'positionalParameters: [$result],';
}

String _renderParameter(ParameterElement p) =>
    "DeclarationMirror("
        "name: '${_getSerializedNameFromParameter(p)}',"
        'type: ${_renderType(p.type)}'
        '${p.isNotOptional ? ', isRequired: true' : ''}'
        '${p.isNamed ? ', isNamed: true' : ''}'
        '${p.metadata.isEmpty ? '' : ','} ${_renderMetadata(p.metadata)}'
        ')';

String _renderFieldsDeclarations(FieldElement e) =>
    "const \$\$${e.enclosingElement.name}_fields_${e.name} = DeclarationMirror("
        "name: '${_getSerializedNameFromField(e)}',"
        'type: ${_renderType(e.type)}'
        '${e.isFinal ? ', isFinal: true' : ''}'
        '${e.metadata.isEmpty ? '' : ','} ${_renderMetadata(e.metadata)}'
        ');';

String _renderFields(VariableElement e) =>
    "'${_getSerializedNameFromField(e)}': \$\$${e.enclosingElement.name}_fields_${e.name}";

String _getSerializedNameFromField(FieldElement f) {
  return f.metadata
      .firstWhere((a) => (a.computeConstantValue().type.element as ClassElement).name == 'SerializedName',
      orElse: () => null)
      ?.constantValue
      ?.getField('name')
      ?.toStringValue() ??
      f.displayName;
}

String _getSerializedNameFromAccessor(PropertyAccessorElement a) =>
    _getSerializedNameFromField((a.enclosingElement as ClassElement).getField(a.displayName));

String _getSerializedNameFromParameter(ParameterElement p) {
  var field;
  if (p.enclosingElement is ConstructorElement) {
    field = (p.enclosingElement.enclosingElement as ClassElement).getField(p.displayName);
  }
  return field == null ? p.displayName : _getSerializedNameFromField(field);
}

String _renderMetadata(List<ElementAnnotation> metadata) {
  var annotations = metadata.where((a) => (a.computeConstantValue().type.element as ClassElement).allSupertypes.any((st) => st.name == 'Annotation'));
  return annotations.isNotEmpty
      ? "annotations: [${annotations.map((a) =>
  a.element is ConstructorElement
      ? '${a.constantValue.type}${_renderAnnotationParameters(a)}'
      : a.element.name).join(',')}]"
      : '';
}

String _renderAnnotationParameters(ElementAnnotation annotation) {
  return (annotation.element as ConstructorElement).parameters.map((p) =>
  p.isNamed
      ? '${p.name}: ${_renderParameterValue(p, annotation)}'
      : _renderParameterValue(p, annotation)).toString();
}

String _renderParameterValue(ParameterElement parameter, ElementAnnotation annotation) {
  var thingy = ConstantReader(annotation.computeConstantValue()).read(parameter.name);

  return (thingy?.isNull != false) ? 'null' : _renderValue(thingy.objectValue);
}

String _renderValue(DartObject field) {
  if (field.type is FunctionType) return field.toFunctionValue().displayName;

  var cr = ConstantReader(field);
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
        ? '[${type.name}, ${_renderTypes(type.typeArguments)}]'
        : type is TypeParameterType
          ? 'dynamic'
          : type.name != 'void'
            ? type.name
            : 'null';

String _renderTypes(List<DartType> types) =>
    types.length > 1
        ? '[${types.map(_renderType).join(',')}]'
        : _renderType(types[0]);
