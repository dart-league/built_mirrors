// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// MirrorsGenerator
// **************************************************************************

const someFunctionFunctionMirror = FunctionMirror(
    positionalParameters: [
      DeclarationMirror(
          name: 'p1',
          type: int,
          isRequired: true,
          annotations: [myOtherAnnotation]),
      DeclarationMirror(name: 'p0', type: int, isRequired: true),
      DeclarationMirror(name: 'p2', type: int, isRequired: true)
    ],
    name: 'someFunction',
    returnType: String,
    annotations: [AnnotationWithFunction(otherFunction)]);

// **************************************************************************
// InitMirrorsGenerator
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
