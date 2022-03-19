// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_mirrors.test.enum_test;

// **************************************************************************
// MirrorsGenerator
// **************************************************************************

_ClassWithMethods__Constructor([positionalParams, namedParams]) =>
    ClassWithMethods();

const ClassWithMethodsClassMirror =
    ClassMirror(name: 'ClassWithMethods', constructors: {
  '': FunctionMirror(name: '', $call: _ClassWithMethods__Constructor)
}, methods: {
  'methodNoReturnTypeNoParams': FunctionMirror(
    name: 'methodNoReturnTypeNoParams',
    returnType: dynamic,
  ),
  'methodNoReturnTypeWithParams': FunctionMirror(
    positionalParameters: [
      DeclarationMirror(name: 'param1', type: String, isRequired: true)
    ],
    name: 'methodNoReturnTypeWithParams',
    returnType: dynamic,
  ),
  'methodWithAnnotation': FunctionMirror(
      name: 'methodWithAnnotation',
      returnType: dynamic,
      annotations: [SomeAnnotation()]),
  'methodWithAnnotatedParams': FunctionMirror(
    positionalParameters: [
      DeclarationMirror(
          name: 'p1',
          type: dynamic,
          isRequired: true,
          annotations: [SomeAnnotation()])
    ],
    name: 'methodWithAnnotatedParams',
    returnType: dynamic,
  ),
  'methodWithReturnTypeAndParams': FunctionMirror(
    namedParameters: {
      'b': DeclarationMirror(name: 'b', type: String, isNamed: true),
      'c': DeclarationMirror(name: 'c', type: int, isNamed: true)
    },
    name: 'methodWithReturnTypeAndParams',
    returnType: String,
  )
});

_ClassWithAnnotationWithFunction__Constructor(
        [positionalParams, namedParams]) =>
    ClassWithAnnotationWithFunction();

const ClassWithAnnotationWithFunctionClassMirror =
    ClassMirror(name: 'ClassWithAnnotationWithFunction', constructors: {
  '': FunctionMirror(
      name: '', $call: _ClassWithAnnotationWithFunction__Constructor)
}, annotations: [
  AnnotationWithFunction(someFunction)
]);

_ClassWithAnnotationWithList__Constructor([positionalParams, namedParams]) =>
    ClassWithAnnotationWithList();

const ClassWithAnnotationWithListClassMirror =
    ClassMirror(name: 'ClassWithAnnotationWithList', constructors: {
  '': FunctionMirror(name: '', $call: _ClassWithAnnotationWithList__Constructor)
}, annotations: [
  AnnotationWithList(const [r'hello', r'hi'])
]);

_ClassWithAnnotationWithMap__Constructor([positionalParams, namedParams]) =>
    ClassWithAnnotationWithMap();

const ClassWithAnnotationWithMapClassMirror =
    ClassMirror(name: 'ClassWithAnnotationWithMap', constructors: {
  '': FunctionMirror(name: '', $call: _ClassWithAnnotationWithMap__Constructor)
}, annotations: [
  AnnotationWithMap(const {r'k1': r'v1', r'k2': r'v2'})
]);

_ClassWithAnnotationWithConstant__Constructor(
        [positionalParams, namedParams]) =>
    ClassWithAnnotationWithConstant();

const ClassWithAnnotationWithConstantClassMirror =
    ClassMirror(name: 'ClassWithAnnotationWithConstant', constructors: {
  '': FunctionMirror(
      name: '', $call: _ClassWithAnnotationWithConstant__Constructor)
}, annotations: [
  AnnotationWithConstant(const SomeConstant(r'my-constant'),
      otherConstant: const SomeConstant(r'other-constant'))
]);

const ColorClassMirror =
    ClassMirror(name: 'Color', isEnum: true, values: Color.values);

// **************************************************************************
// InitMirrorsGenerator
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
}
