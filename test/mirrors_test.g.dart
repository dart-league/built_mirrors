// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_mirrors.test.enum_test;

// **************************************************************************
// Generator: MirrorsGenerator
// **************************************************************************

const ColorClassMirror =
    const ClassMirror(name: 'Color', isEnum: true, values: Color.values);
_ClassWithMethods__Constructor([positionalParams, namedParams]) =>
    new ClassWithMethods();

const ClassWithMethodsClassMirror =
    const ClassMirror(name: 'ClassWithMethods', constructors: const {
  '': const FunctionMirror($call: _ClassWithMethods__Constructor)
}, methods: const {
  'methodNoReturnTypeNoParams': const FunctionMirror(
    name: 'methodNoReturnTypeNoParams',
    returnType: dynamic,
  ),
  'methodNoReturnTypeWithParams': const FunctionMirror(
    name: 'methodNoReturnTypeWithParams',
    returnType: dynamic,
  ),
  'methodWithAnnotation': const FunctionMirror(
      name: 'methodWithAnnotation',
      returnType: dynamic,
      annotations: const [const SomeAnnotation()]),
  'methodWithAnnotatedParams': const FunctionMirror(
    name: 'methodWithAnnotatedParams',
    returnType: dynamic,
  ),
  'methodWithReturnTypeAndParams': const FunctionMirror(
    name: 'methodWithReturnTypeAndParams',
    returnType: String,
  )
});
_ClassWithAnnotationWithFunction__Constructor(
        [positionalParams, namedParams]) =>
    new ClassWithAnnotationWithFunction();

const ClassWithAnnotationWithFunctionClassMirror = const ClassMirror(
    name: 'ClassWithAnnotationWithFunction',
    constructors: const {
      '': const FunctionMirror(
          $call: _ClassWithAnnotationWithFunction__Constructor)
    },
    annotations: const [
      const AnnotationWithFunction(someFunction)
    ]);
_ClassWithAnnotationWithList__Constructor([positionalParams, namedParams]) =>
    new ClassWithAnnotationWithList();

const ClassWithAnnotationWithListClassMirror =
    const ClassMirror(name: 'ClassWithAnnotationWithList', constructors: const {
  '': const FunctionMirror($call: _ClassWithAnnotationWithList__Constructor)
}, annotations: const [
  const AnnotationWithList(const [r'hello', r'hi'])
]);
_ClassWithAnnotationWithMap__Constructor([positionalParams, namedParams]) =>
    new ClassWithAnnotationWithMap();

const ClassWithAnnotationWithMapClassMirror =
    const ClassMirror(name: 'ClassWithAnnotationWithMap', constructors: const {
  '': const FunctionMirror($call: _ClassWithAnnotationWithMap__Constructor)
}, annotations: const [
  const AnnotationWithMap(const {r'k1': r'v1', r'k2': r'v2'})
]);
_ClassWithAnnotationWithConstant__Constructor(
        [positionalParams, namedParams]) =>
    new ClassWithAnnotationWithConstant();

const ClassWithAnnotationWithConstantClassMirror = const ClassMirror(
    name: 'ClassWithAnnotationWithConstant',
    constructors: const {
      '': const FunctionMirror(
          $call: _ClassWithAnnotationWithConstant__Constructor)
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
