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
_ClassWithAnnotationWithList__Constructor(params) =>
    new ClassWithAnnotationWithList();

const ClassWithAnnotationWithListClassMirror =
    const ClassMirror(name: 'ClassWithAnnotationWithList', constructors: const {
  '': const FunctionMirror(
      parameters: const {}, call: _ClassWithAnnotationWithList__Constructor)
}, annotations: const [
  const AnnotationWithList(const [r'hello', r'hi'])
]);
_ClassWithAnnotationWithMap__Constructor(params) =>
    new ClassWithAnnotationWithMap();

const ClassWithAnnotationWithMapClassMirror =
    const ClassMirror(name: 'ClassWithAnnotationWithMap', constructors: const {
  '': const FunctionMirror(
      parameters: const {}, call: _ClassWithAnnotationWithMap__Constructor)
}, annotations: const [
  const AnnotationWithMap(const {r'k1': r'v1', r'k2': r'v2'})
]);
_ClassWithAnnotationWithConstant__Constructor(params) =>
    new ClassWithAnnotationWithConstant();

const ClassWithAnnotationWithConstantClassMirror = const ClassMirror(
    name: 'ClassWithAnnotationWithConstant',
    constructors: const {
      '': const FunctionMirror(
          parameters: const {},
          call: _ClassWithAnnotationWithConstant__Constructor)
    },
    annotations: const [
      const AnnotationWithConstant(const SomeConstant(r'my-constant'),
          otherConstant: const SomeConstant(r'other-constant'))
    ]);

// **************************************************************************
// Generator: InitMirrorsGenerator
// **************************************************************************

_initMirrors() {
  initClassMirrors({
    Color: ColorClassMirror,
    ClassWithMethods: ClassWithMethodsClassMirror,
    ClassWithAnnotationWithFunction: ClassWithAnnotationWithFunctionClassMirror,
    ClassWithAnnotationWithList: ClassWithAnnotationWithListClassMirror,
    ClassWithAnnotationWithMap: ClassWithAnnotationWithMapClassMirror,
    ClassWithAnnotationWithConstant: ClassWithAnnotationWithConstantClassMirror
  });
  initFunctionMirrors({});
}
