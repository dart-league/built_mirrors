// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_mirrors.example.main;

// **************************************************************************
// Generator: MirrorsGenerator
// **************************************************************************

const someFunctionFunctionMirror = const FunctionMirror(
    positionalParameters: const [
      const DeclarationMirror(
          name: 'p1',
          type: int,
          isRequired: true,
          annotations: const [myOtherAnnotation]),
      const DeclarationMirror(name: 'p0', type: int, isRequired: true),
      const DeclarationMirror(name: 'p2', type: int, isRequired: true)
    ],
    name: 'someFunction',
    returnType: String,
    annotations: const [const AnnotationWithFunction(otherFunction)]);

// **************************************************************************
// Generator: InitMirrorsGenerator
// **************************************************************************

_initMirrors() {
  initClassMirrors({
    Person: PersonClassMirror,
    Car: CarClassMirror,
    EmptyClass: EmptyClassClassMirror,
    ExtendedPerson: ExtendedPersonClassMirror,
    ClassWithMethod: ClassWithMethodClassMirror
  });
  initFunctionMirrors({someFunction: someFunctionFunctionMirror});
}
