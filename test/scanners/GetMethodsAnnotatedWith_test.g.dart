// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetMethodsAnnotatedWith_test;

// **************************************************************************
// Generator: InitMirrorsGenerator
// Target: library GetMethodsAnnotatedWith_test
// **************************************************************************

_initMirrors() {
  initClassMirrors(
      {ObjectWithAnnotatedMethods: ObjectWithAnnotatedMethodsClassMirror});
  initFunctionMirrors({});
}

// **************************************************************************
// Generator: MirrorsGenerator
// Target: class ObjectWithAnnotatedMethods
// **************************************************************************

_ObjectWithAnnotatedMethods__Constructor(params) =>
    new ObjectWithAnnotatedMethods();

const ObjectWithAnnotatedMethodsClassMirror =
    const ClassMirror(name: 'ObjectWithAnnotatedMethods', constructors: const {
  '': const FunctionMirror(
      parameters: const {}, call: _ObjectWithAnnotatedMethods__Constructor)
}, methods: const {
  'annotated1': const FunctionMirror(
      name: 'annotated1',
      returnType: dynamic,
      annotations: const [const Annotation1(), const Annotation2()]),
  'annotated2': const FunctionMirror(
      name: 'annotated2',
      returnType: dynamic,
      annotations: const [const Annotation1()])
});
