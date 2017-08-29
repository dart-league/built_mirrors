// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_mirrors.test.enum_test;

// **************************************************************************
// Generator: MirrorsGenerator
// **************************************************************************

const ColorClassMirror =
    const ClassMirror(name: 'Color', isEnum: true, values: Color.values);
_ClassWithMethods__Constructor(params) => new ClassWithMethods();

const ClassWithMethodsClassMirror =
    const ClassMirror(name: 'ClassWithMethods', constructors: const {
  '': const FunctionMirror(
      parameters: const {}, call: _ClassWithMethods__Constructor)
}, methods: const {
  'methodNoReturnTypeNoParams': const FunctionMirror(
    name: 'methodNoReturnTypeNoParams',
    returnType: dynamic,
  ),
  'methodNoReturnTypeWithParams': const FunctionMirror(
    name: 'methodNoReturnTypeWithParams',
    returnType: dynamic,
    parameters: const {
      'param1': const DeclarationMirror(name: 'param1', type: String)
    },
  ),
  'methodWithAnnotation': const FunctionMirror(
      name: 'methodWithAnnotation',
      returnType: dynamic,
      annotations: const [const SomeAnnotation()]),
  'methodWithAnnotatedParams': const FunctionMirror(
    name: 'methodWithAnnotatedParams',
    returnType: dynamic,
    parameters: const {
      'p1': const DeclarationMirror(
          name: 'p1',
          type: dynamic,
          annotations: const [const SomeAnnotation()])
    },
  ),
  'methodWithReturnTypeAndParams': const FunctionMirror(
    name: 'methodWithReturnTypeAndParams',
    returnType: String,
    parameters: const {
      'b': const DeclarationMirror(name: 'b', type: String),
      'c': const DeclarationMirror(name: 'c', type: int)
    },
  )
});
_ClassWithAnnotationWithFunction__Constructor(params) =>
    new ClassWithAnnotationWithFunction();

const ClassWithAnnotationWithFunctionClassMirror = const ClassMirror(
    name: 'ClassWithAnnotationWithFunction',
    constructors: const {
      '': const FunctionMirror(
          parameters: const {},
          call: _ClassWithAnnotationWithFunction__Constructor)
    },
    annotations: const [
      const AnnotationWithFunction(someFunction)
    ]);

// **************************************************************************
// Generator: InitMirrorsGenerator
// **************************************************************************

_initMirrors() {
  initClassMirrors({
    Color: ColorClassMirror,
    ClassWithMethods: ClassWithMethodsClassMirror,
    ClassWithAnnotationWithFunction: ClassWithAnnotationWithFunctionClassMirror
  });
  initFunctionMirrors({});
}
