// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetFieldsAnnotatedWith_test;

// **************************************************************************
// MirrorsGenerator
// **************************************************************************

_ObjectWithAnnotatedFields__Constructor([positionalParams, namedParams]) =>
    ObjectWithAnnotatedFields();

const $$ObjectWithAnnotatedFields_fields_annotated1 = DeclarationMirror(
    name: 'annotated1',
    type: dynamic,
    annotations: [Annotation1(), Annotation2()]);
const $$ObjectWithAnnotatedFields_fields_annotated2 = DeclarationMirror(
    name: 'annotated2', type: dynamic, annotations: [Annotation1()]);

const ObjectWithAnnotatedFieldsClassMirror =
    ClassMirror(name: 'ObjectWithAnnotatedFields', constructors: {
  '': FunctionMirror(name: '', $call: _ObjectWithAnnotatedFields__Constructor)
}, fields: {
  'annotated1': $$ObjectWithAnnotatedFields_fields_annotated1,
  'annotated2': $$ObjectWithAnnotatedFields_fields_annotated2
}, getters: [
  'annotated1',
  'annotated2'
], setters: [
  'annotated1',
  'annotated2'
]);

// **************************************************************************
// InitMirrorsGenerator
// **************************************************************************

_initMirrors() {
  initClassMirrors(
      {ObjectWithAnnotatedFields: ObjectWithAnnotatedFieldsClassMirror});
}
