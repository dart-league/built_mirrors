// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_mirrors.example.models;

// **************************************************************************
// MirrorsGenerator
// **************************************************************************

_Person__Constructor([positionalParams, namedParams]) => new Person(
    id: namedParams['id'],
    name: namedParams['name'],
    myDynamic: namedParams['myDynamic'],
    cars: namedParams['cars']);

const $$Person_fields_id = const DeclarationMirror(name: 'id', type: int);
const $$Person_fields_name = const DeclarationMirror(
    name: 'name',
    type: String,
    annotations: const [const MyAnnotation(r'helloꯍ', val2: null)]);
const $$Person_fields_myDynamic =
    const DeclarationMirror(name: 'myDynamic', type: dynamic);
const $$Person_fields_cars =
    const DeclarationMirror(name: 'cars', type: const [List, Car]);
const $$Person_fields_myGetter =
    const DeclarationMirror(name: 'myGetter', type: String, isFinal: true);
const $$Person_fields_mySetter =
    const DeclarationMirror(name: 'mySetter', type: String);

const PersonClassMirror =
    const ClassMirror(name: 'Person', constructors: const {
  '': const FunctionMirror(
      name: '',
      namedParameters: const {
        'id': const DeclarationMirror(name: 'id', type: int, isNamed: true),
        'name':
            const DeclarationMirror(name: 'name', type: String, isNamed: true),
        'myDynamic': const DeclarationMirror(
            name: 'myDynamic', type: dynamic, isNamed: true),
        'cars': const DeclarationMirror(
            name: 'cars', type: const [List, Car], isNamed: true)
      },
      $call: _Person__Constructor)
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
_Car__Constructor([positionalParams, namedParams]) =>
    new Car(positionalParams[0], positionalParams[1]);

const $$Car_fields_id = const DeclarationMirror(name: 'id', type: int);
const $$Car_fields_engine = const DeclarationMirror(
    name: 'engine',
    type: String,
    annotations: const [const MyAnnotation(r'\uabcd', val2: null)]);

const CarClassMirror = const ClassMirror(name: 'Car', constructors: const {
  '': const FunctionMirror(
      name: '',
      positionalParameters: const [
        const DeclarationMirror(name: 'id', type: int),
        const DeclarationMirror(name: 'engine', type: String)
      ],
      $call: _Car__Constructor)
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
_EmptyClass__Constructor([positionalParams, namedParams]) => new EmptyClass();

const EmptyClassClassMirror = const ClassMirror(
    name: 'EmptyClass',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _EmptyClass__Constructor)
    });
_ExtendedPerson__Constructor([positionalParams, namedParams]) =>
    new ExtendedPerson();

const $$ExtendedPerson_fields_extendedName =
    const DeclarationMirror(name: 'extendedName', type: dynamic);
const $$ExtendedPerson_fields_otherExtended =
    const DeclarationMirror(name: 'otherExtended', type: dynamic);

const ExtendedPersonClassMirror = const ClassMirror(
    name: 'ExtendedPerson',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _ExtendedPerson__Constructor)
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
_ClassWithMethod__Constructor([positionalParams, namedParams]) =>
    new ClassWithMethod();

const ClassWithMethodClassMirror =
    const ClassMirror(name: 'ClassWithMethod', constructors: const {
  '': const FunctionMirror(name: '', $call: _ClassWithMethod__Constructor)
}, methods: const {
  'someMethod': const FunctionMirror(
      positionalParameters: const [
        const DeclarationMirror(
            name: 'someParameter',
            type: String,
            isRequired: true,
            annotations: const [myOtherAnnotation])
      ],
      name: 'someMethod',
      returnType: dynamic,
      annotations: const [myOtherAnnotation]),
  'someMethodWithNamedParams': const FunctionMirror(
      namedParameters: const {
        'someParameter': const DeclarationMirror(
            name: 'someParameter',
            type: String,
            isNamed: true,
            annotations: const [myOtherAnnotation])
      },
      name: 'someMethodWithNamedParams',
      returnType: dynamic,
      annotations: const [myOtherAnnotation])
});
