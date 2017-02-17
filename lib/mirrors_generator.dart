import 'dart:async';

import 'package:analyzer/analyzer.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:built_mirrors/built_mirrors.dart';
import 'package:source_gen/source_gen.dart';

/// Generates ClassMirror constants from classes annotated with `@Reflectable()`
class MirrorsGenerator extends GeneratorForAnnotation<Reflectable> {
  const MirrorsGenerator();

  @override
  Future<String> generateForAnnotatedElement(Element element, Reflectable annotation, BuildStep buildStep) async {
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

      return '''${element.isAbstract ? '' : constructors.map((c) => '_${className}_${c.name}_Constructor(params) =>'
          'new ${className}${c.name.isEmpty ? '' : '.${c.name}'}(${_renderConstructorParametersCall(c)});\n').join('')}

${element.fields.map(_renderFieldsDeclarations).join('\n')}

const ${className}ClassMirror = const ClassMirror(
  name: '${element.name}',
  ${[
        element.isAbstract ? '' : '''constructors: const {
          ${constructors.map((c) => "'${c.name}': const FunctionMirror("
            "parameters: const {${c.parameters.map(_renderParameter).join(',')}},"
            "call: _${className}_${c.name}_Constructor)").join(',')}
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

List<Element> _distinctByName(Iterable<Element> elements) {
  var result = [];
  for (var element in elements) {
    if (!result.any((e) => e.name == element.name)) result.add(element);
  }
  return result;
}

String _combine(String pv, String e) =>
    pv.isNotEmpty && e.isNotEmpty ? pv + ',' + e : pv.isEmpty ? e : e.isEmpty ? pv : '';

String _renderConstructorParametersCall(ConstructorElement c) {
  return c.parameters.map((p) =>
  p.parameterKind == ParameterKind.NAMED ? "${p.name}: params['${p.name}']" : "params['${p.name}']").join(',');
}

String _renderMethods(MethodElement m) =>
    "'${m.name}': " + _renderFunction(m);

String _renderFunction(ExecutableElement f) =>
    "const FunctionMirror("
        "name: '${f.name}',"
        'returnType: ${_renderType(f.returnType)}'
        + (f.parameters.isNotEmpty ? ', parameters: const {${f.parameters.map(_renderParameter).join(',')}}' : '')
        + ',' + _renderMetadata(f.metadata) +
        ')';

String _renderParameter(ParameterElement e) =>
    "'${e.name}': const DeclarationMirror("
        'type: ${_renderType(e.type)}'
        '${e.parameterKind == ParameterKind.REQUIRED ? '' : ', isOptional: true'}'
        '${e.metadata.isEmpty ? '' : ','} ${_renderMetadata(e.metadata)}'
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
  var field = annotation.constantValue.getField(parameter.name);
  switch (field.type.toString()) {
    case 'String':
      return "'${field.toStringValue()}'";
    case 'int':
      return field.toIntValue();
    case 'double':
      return field.toDoubleValue();
    case 'bool':
      return field.toBoolValue();
    case 'Map':
      return field.toMapValue();
    case 'List':
      return field.toListValue();
  }
  return 'null';
}


String _renderType(DartType type) =>
    type is ParameterizedType && type.typeArguments.isNotEmpty
        ? 'const [${type.name}, ${_renderTypes(type.typeArguments)}]'
        : type.name;

String _renderTypes(List<DartType> types) =>
    types.length > 1
        ? 'const [${types.map(_renderType).join(',')}]'
        : _renderType(types[0]);