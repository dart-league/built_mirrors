// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_mirrors.example;

// **************************************************************************
// Generator: BuiltMirrorsGenerator
// Target: class Person
// **************************************************************************

_Person__Constructor(params) => new Person(
    id: params['id'],
    name: params['name'],
    myDynamic: params['myDynamic'],
    cars: params['cars']);

const $$Person_fields_id = const DeclarationMirror(type: int);
const $$Person_fields_name = const DeclarationMirror(
    type: String, annotations: const [const MyAnnotation('hello', val2: null)]);
const $$Person_fields_myDynamic = const DeclarationMirror(type: dynamic);
const $$Person_fields_cars = const DeclarationMirror(type: const [List, Car]);
const $$Person_fields_myGetter = const DeclarationMirror(type: String);
const $$Person_fields_mySetter = const DeclarationMirror(type: String);

const PersonClassMirror = const ClassMirror(constructors: const {
  '': const FunctionMirror(parameters: const {
    'id': const DeclarationMirror(type: int),
    'name': const DeclarationMirror(type: String),
    'myDynamic': const DeclarationMirror(type: dynamic),
    'cars': const DeclarationMirror(type: const [List, Car])
  }, call: _Person__Constructor)
}, fields: const {
  'id': $$Person_fields_id,
  'name': $$Person_fields_name,
  'myDynamic': $$Person_fields_myDynamic,
  'cars': $$Person_fields_cars,
  'myGetter': $$Person_fields_myGetter,
  'mySetter': $$Person_fields_mySetter
}, getters: const [
  'id',
  'name',
  'myDynamic',
  'cars',
  'myGetter'
], setters: const [
  'id',
  'name',
  'myDynamic',
  'cars',
  'mySetter'
]);

// **************************************************************************
// Generator: BuiltMirrorsGenerator
// Target: class Car
// **************************************************************************

_Car__Constructor(params) => new Car(params['id'], params['engine']);

const $$Car_fields_id = const DeclarationMirror(type: int);
const $$Car_fields_engine = const DeclarationMirror(type: String);

const CarClassMirror = const ClassMirror(constructors: const {
  '': const FunctionMirror(parameters: const {
    'id': const DeclarationMirror(type: int),
    'engine': const DeclarationMirror(type: String)
  }, call: _Car__Constructor)
}, fields: const {
  'id': $$Car_fields_id,
  'engine': $$Car_fields_engine
}, getters: const [
  'id',
  'engine'
], setters: const [
  'id',
  'engine'
]);

// **************************************************************************
// Generator: BuiltMirrorsGenerator
// Target: class EmptyClass
// **************************************************************************

_EmptyClass__Constructor(params) => new EmptyClass();

const EmptyClassClassMirror = const ClassMirror(constructors: const {
  '': const FunctionMirror(parameters: const {}, call: _EmptyClass__Constructor)
});

// **************************************************************************
// Generator: BuiltMirrorsGenerator
// Target: class ExtendedPerson
// **************************************************************************

_ExtendedPerson__Constructor(params) => new ExtendedPerson();

const $$ExtendedPerson_fields_extendedName =
    const DeclarationMirror(type: dynamic);
const $$ExtendedPerson_fields_otherExtended =
    const DeclarationMirror(type: dynamic);

const ExtendedPersonClassMirror = const ClassMirror(constructors: const {
  '': const FunctionMirror(
      parameters: const {}, call: _ExtendedPerson__Constructor)
}, fields: const {
  'extendedName': $$ExtendedPerson_fields_extendedName,
  'otherExtended': $$ExtendedPerson_fields_otherExtended,
  'id': $$Person_fields_id,
  'name': $$Person_fields_name,
  'myDynamic': $$Person_fields_myDynamic,
  'cars': $$Person_fields_cars,
  'myGetter': $$Person_fields_myGetter,
  'mySetter': $$Person_fields_mySetter
}, getters: const [
  'id',
  'name',
  'myDynamic',
  'cars',
  'myGetter',
  'extendedName',
  'otherExtended'
], setters: const [
  'id',
  'name',
  'myDynamic',
  'cars',
  'mySetter',
  'extendedName',
  'otherExtended'
]);
