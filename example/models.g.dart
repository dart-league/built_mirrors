// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_mirrors.example.models;

// **************************************************************************
// Generator: MirrorsGenerator
// **************************************************************************

_Person__Constructor(params) => new Person(
    id: params['id'],
    name: params['name'],
    myDynamic: params['myDynamic'],
    cars: params['cars']);

const $$Person_fields_id = const DeclarationMirror(type: int);
const $$Person_fields_name = const DeclarationMirror(
    type: String,
    annotations: const [const MyAnnotation(r'helloꯍ', val2: null)]);
const $$Person_fields_myDynamic = const DeclarationMirror(type: dynamic);
const $$Person_fields_cars = const DeclarationMirror(type: const [List, Car]);
const $$Person_fields_myGetter =
    const DeclarationMirror(type: String, isFinal: true);
const $$Person_fields_mySetter = const DeclarationMirror(type: String);

const PersonClassMirror =
    const ClassMirror(name: 'Person', constructors: const {
  '': const FunctionMirror(parameters: const {
    'id': const DeclarationMirror(name: 'id', type: int, isOptional: true),
    'name':
        const DeclarationMirror(name: 'name', type: String, isOptional: true),
    'myDynamic': const DeclarationMirror(
        name: 'myDynamic', type: dynamic, isOptional: true),
    'cars': const DeclarationMirror(
        name: 'cars', type: const [List, Car], isOptional: true)
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
_Car__Constructor(params) => new Car(params['id'], params['engine']);

const $$Car_fields_id = const DeclarationMirror(type: int);
const $$Car_fields_engine = const DeclarationMirror(
    type: String,
    annotations: const [const MyAnnotation(r'\uabcd', val2: null)]);

const CarClassMirror = const ClassMirror(name: 'Car', constructors: const {
  '': const FunctionMirror(parameters: const {
    'id': const DeclarationMirror(name: 'id', type: int, isOptional: true),
    'engine':
        const DeclarationMirror(name: 'engine', type: String, isOptional: true)
  }, call: _Car__Constructor)
}, annotations: const [
  myOtherAnnotation
], fields: const {
  'id': $$Car_fields_id,
  'engine': $$Car_fields_engine
}, getters: const [
  'id',
  'engine'
], setters: const [
  'id',
  'engine'
]);
_EmptyClass__Constructor(params) => new EmptyClass();

const EmptyClassClassMirror =
    const ClassMirror(name: 'EmptyClass', constructors: const {
  '': const FunctionMirror(parameters: const {}, call: _EmptyClass__Constructor)
});
_ExtendedPerson__Constructor(params) => new ExtendedPerson();

const $$ExtendedPerson_fields_extendedName =
    const DeclarationMirror(type: dynamic);
const $$ExtendedPerson_fields_otherExtended =
    const DeclarationMirror(type: dynamic);

const ExtendedPersonClassMirror = const ClassMirror(
    name: 'ExtendedPerson',
    constructors: const {
      '': const FunctionMirror(
          parameters: const {}, call: _ExtendedPerson__Constructor)
    },
    fields: const {
      'extendedName': $$ExtendedPerson_fields_extendedName,
      'otherExtended': $$ExtendedPerson_fields_otherExtended,
      'id': $$Person_fields_id,
      'name': $$Person_fields_name,
      'myDynamic': $$Person_fields_myDynamic,
      'cars': $$Person_fields_cars,
      'myGetter': $$Person_fields_myGetter,
      'mySetter': $$Person_fields_mySetter
    },
    getters: const [
      'extendedName',
      'otherExtended',
      'id',
      'name',
      'myDynamic',
      'cars',
      'myGetter'
    ],
    setters: const [
      'extendedName',
      'otherExtended',
      'id',
      'name',
      'myDynamic',
      'cars',
      'mySetter'
    ],
    superclass: Person);
_ClassWithMethod__Constructor(params) => new ClassWithMethod();

const ClassWithMethodClassMirror =
    const ClassMirror(name: 'ClassWithMethod', constructors: const {
  '': const FunctionMirror(
      parameters: const {}, call: _ClassWithMethod__Constructor)
}, methods: const {
  'someMethod': const FunctionMirror(
      name: 'someMethod',
      returnType: dynamic,
      parameters: const {
        'someParameter': const DeclarationMirror(
            name: 'someParameter',
            type: String,
            annotations: const [myOtherAnnotation])
      },
      annotations: const [
        myOtherAnnotation
      ])
});
