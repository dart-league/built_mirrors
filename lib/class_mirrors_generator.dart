import 'dart:async';

import 'package:analyzer/analyzer.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:built_mirrors/built_mirrors.dart';
import 'package:source_gen/source_gen.dart';

/// Generates ClassMirror constants from classes annotated with `@Reflectable()`
class ClassMirrorsGenerator extends GeneratorForAnnotation<Reflectable> {
  const ClassMirrorsGenerator();

  @override
  Future<String> generateForAnnotatedElement(ClassElement element, Reflectable annotation, BuildStep buildStep) async {
    if(element.isEnum) {
      return "const ${element.name}ClassMirror = const ClassMirror("
          "name: '${element.name}',"
          "isEnum: true,"
          "values: ${element.name}.values);";
    }

    var constructors = element.constructors;
    var className = element.name;
    var fields = element.fields;
    var accessors = element.accessors;
    var getters = accessors.where((a) => a.kind == ElementKind.GETTER);
    var setters = accessors.where((a) => a.kind == ElementKind.SETTER);

    var noObjectSt = element.allSupertypes.where((st) => st.element.name != 'Object');
    var stFields = noObjectSt.expand((st) => st.element.fields);
    var stAccessors = noObjectSt.expand((st) => st.element.accessors);
    var stGetters = stAccessors.where((a) => a.kind == ElementKind.GETTER);
    var stSetters = stAccessors.where((a) => a.kind == ElementKind.SETTER);

    return '''${constructors.map((c) => '_${className}_${c.name}_Constructor(params) =>'
        'new ${className}${c.name.isEmpty ? '' : '.${c.name}'}(${_renderConstructorParametersCall(c)});').join('\n')}

${fields.map(_renderFieldsDeclarations).join('\n')}

const ${className}ClassMirror = const ClassMirror(
  name: '${element.name}',
  ${[
    '''constructors: const {
      ${constructors.map((c) => "'${c.name}': const FunctionMirror("
          "parameters: const {${c.parameters.map(_renderParameter).join(',')}},"
          "call: _${className}_${c.name}_Constructor)").join(',')}
    }'''
    '${_renderMetadata(element.metadata)}',
    fields.isNotEmpty || stFields.isNotEmpty ? '''fields: const {
      ${[
        fields.map(_renderFields).join(','),
        stFields.map(_renderFields).join(',')
      ].fold('', _combine)}
    }''' : '',
    getters.isNotEmpty || stGetters.isNotEmpty ? 'getters: const [${[
      stGetters.map((g) => "'${g.name}'").join(','),
      getters.map((g) => "'${g.name}'").join(',')
    ].fold('', _combine)}]' : '',
    setters.isNotEmpty || stSetters.isNotEmpty ? 'setters: const [${[
      stSetters.map((s) => "'${s.name.substring(0, s.name.length - 1)}'").join(','),
      setters.map((s) => "'${s.name.substring(0, s.name.length - 1)}'").join(',')
    ].fold('', _combine)}]' : '',
  ].fold('', _combine)}
);''';
  }
}


String _combine(String pv, String e) => pv.isNotEmpty && e.isNotEmpty ? pv + ',' + e : pv.isEmpty ? e : e.isEmpty ? pv : '';

String _renderConstructorParametersCall(ConstructorElement c) {
  return c.parameters.map((p) =>
      p.parameterKind == ParameterKind.NAMED ? "${p.name}: params['${p.name}']" : "params['${p.name}']").join(',');
}

String _renderParameter(ParameterElement e) =>
    "'${e.name}': const DeclarationMirror("
      'type: ${_renderType(e.type)}'
      '${e.parameterKind == ParameterKind.REQUIRED ? '' : ', isOptional: true'}'
      '${_renderMetadata(e.metadata)}'
    ')';

String _renderFieldsDeclarations(FieldElement e) =>
    "const \$\$${e.enclosingElement.name}_fields_${e.name} = const DeclarationMirror("
        'type: ${_renderType(e.type)}'
        '${e.isFinal ? ', isFinal: true' : ''}'
        '${_renderMetadata(e.metadata)}'
    ');';

String _renderFields(VariableElement e) =>
    "'${e.name}': \$\$${e.enclosingElement.name}_fields_${e.name}";

String _renderMetadata(List<ElementAnnotation> metadata) {
  var annotations = metadata.where((a) =>
      (a.constantValue.type.element as ClassElement).allSupertypes.any((st) => st.name == 'Annotation'));
  return annotations.isNotEmpty
      ? ", annotations: const [${annotations.map((a) =>
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
    case 'String': return "'${field.toStringValue()}'";
    case 'int': return field.toIntValue();
    case 'double': return field.toDoubleValue();
    case 'bool': return field.toBoolValue();
    case 'Map': return field.toMapValue();
    case 'List': return field.toListValue();
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