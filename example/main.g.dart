// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_mirrors.example.main;

// **************************************************************************
// Generator: InitMirrorsGenerator
// Target: library built_mirrors.example.main
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

// **************************************************************************
// Generator: MirrorsGenerator
// Target: someFunction
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
