// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_mirrors.example.main;

// **************************************************************************
// Generator: MirrorsGenerator
// **************************************************************************

const someFunctionFunctionMirror = const FunctionMirror(
    name: 'someFunction',
    returnType: String,
    parameters: const {
      'p1': const DeclarationMirror(
          type: int, annotations: const [myOtherAnnotation])
    },
    annotations: const [
      const AnnotationWithFunction(otherFunction)
    ]);

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
