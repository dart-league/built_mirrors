// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetFieldsAnnotatedWith_test;

// **************************************************************************
// Generator: InitMirrorsGenerator
// Target: library GetFieldsAnnotatedWith_test
// **************************************************************************

_initMirrors() {
  initClassMirrors(
      {ObjectWithAnnotatedFields: ObjectWithAnnotatedFieldsClassMirror});
  initFunctionMirrors({});
}

// **************************************************************************
// Generator: MirrorsGenerator
// Target: class ObjectWithAnnotatedFields
// **************************************************************************

_ObjectWithAnnotatedFields__Constructor(params) =>
    new ObjectWithAnnotatedFields();

const $$ObjectWithAnnotatedFields_fields_annotated1 = const DeclarationMirror(
    type: dynamic,
    annotations: const [const Annotation1(), const Annotation2()]);
const $$ObjectWithAnnotatedFields_fields_annotated2 = const DeclarationMirror(
    type: dynamic, annotations: const [const Annotation1()]);

const ObjectWithAnnotatedFieldsClassMirror =
    const ClassMirror(name: 'ObjectWithAnnotatedFields', constructors: const {
  '': const FunctionMirror(
      parameters: const {}, call: _ObjectWithAnnotatedFields__Constructor)
}, fields: const {
  'annotated1': $$ObjectWithAnnotatedFields_fields_annotated1,
  'annotated2': $$ObjectWithAnnotatedFields_fields_annotated2
}, getters: const [
  'annotated1',
  'annotated2'
], setters: const [
  'annotated1',
  'annotated2'
]);
