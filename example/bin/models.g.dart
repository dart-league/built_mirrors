// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_mirrors.example.models;

// **************************************************************************
// MirrorsGenerator
// **************************************************************************

_Person__Constructor([positionalParams, namedParams]) => Person(
    id: namedParams['id'],
    name: namedParams['name'],
    myDynamic: namedParams['myDynamic'],
    cars: namedParams['cars']);

const $$Person_fields_id = DeclarationMirror(name: 'id', type: int);
const $$Person_fields_name = DeclarationMirror(
    name: 'name',
    type: String,
    annotations: [MyAnnotation(r'helloꯍ', val2: null)]);
const $$Person_fields_myDynamic =
    DeclarationMirror(name: 'myDynamic', type: dynamic);
const $$Person_fields_cars = DeclarationMirror(name: 'cars', type: [List, Car]);
const $$Person_fields_myGetter =
    DeclarationMirror(name: 'myGetter', type: String, isFinal: true);
const $$Person_fields_mySetter =
    DeclarationMirror(name: 'mySetter', type: String);

const PersonClassMirror = ClassMirror(name: 'Person', constructors: {
  '': FunctionMirror(
      name: '',
      namedParameters: {
        'id': DeclarationMirror(name: 'id', type: int, isNamed: true),
        'name': DeclarationMirror(name: 'name', type: String, isNamed: true),
        'myDynamic':
            DeclarationMirror(name: 'myDynamic', type: dynamic, isNamed: true),
        'cars':
            DeclarationMirror(name: 'cars', type: [List, Car], isNamed: true)
      },
      $call: _Person__Constructor)
}, fields: {
  'id': $$Person_fields_id,
  'name': $$Person_fields_name,
  'myDynamic': $$Person_fields_myDynamic,
  'cars': $$Person_fields_cars,
  'myGetter': $$Person_fields_myGetter,
  'mySetter': $$Person_fields_mySetter
}, getters: [
  'myGetter',
  'id',
  'name',
  'myDynamic',
  'cars'
], setters: [
  'mySetter',
  'id',
  'name',
  'myDynamic',
  'cars'
]);

_Car__Constructor([positionalParams, namedParams]) =>
    Car(positionalParams[0], positionalParams[1]);

const $$Car_fields_id = DeclarationMirror(name: 'id', type: int);
const $$Car_fields_engine = DeclarationMirror(
    name: 'engine',
    type: String,
    annotations: [MyAnnotation(r'\uabcd', val2: null)]);

const CarClassMirror = ClassMirror(name: 'Car', constructors: {
  '': FunctionMirror(
      name: '',
      positionalParameters: [
        DeclarationMirror(name: 'id', type: int),
        DeclarationMirror(name: 'engine', type: String)
      ],
      $call: _Car__Constructor)
}, annotations: [
  myOtherAnnotation
], fields: {
  'id': $$Car_fields_id,
  'engine': $$Car_fields_engine
}, getters: [
  'id',
  'engine'
], setters: [
  'id',
  'engine'
]);

_EmptyClass__Constructor([positionalParams, namedParams]) => EmptyClass();

const EmptyClassClassMirror = ClassMirror(name: 'EmptyClass', constructors: {
  '': FunctionMirror(name: '', $call: _EmptyClass__Constructor)
});

_ExtendedPerson__Constructor([positionalParams, namedParams]) =>
    ExtendedPerson();

const $$ExtendedPerson_fields_extendedName =
    DeclarationMirror(name: 'extendedName', type: dynamic);
const $$ExtendedPerson_fields_otherExtended =
    DeclarationMirror(name: 'otherExtended', type: dynamic);

const ExtendedPersonClassMirror = ClassMirror(
    name: 'ExtendedPerson',
    constructors: {
      '': FunctionMirror(name: '', $call: _ExtendedPerson__Constructor)
    },
    fields: {
      'extendedName': $$ExtendedPerson_fields_extendedName,
      'otherExtended': $$ExtendedPerson_fields_otherExtended,
      'id': $$Person_fields_id,
      'name': $$Person_fields_name,
      'myDynamic': $$Person_fields_myDynamic,
      'cars': $$Person_fields_cars,
      'myGetter': $$Person_fields_myGetter,
      'mySetter': $$Person_fields_mySetter
    },
    getters: [
      'extendedName',
      'otherExtended',
      'myGetter',
      'id',
      'name',
      'myDynamic',
      'cars'
    ],
    setters: [
      'extendedName',
      'otherExtended',
      'mySetter',
      'id',
      'name',
      'myDynamic',
      'cars'
    ],
    superclass: Person);

_ClassWithMethod__Constructor([positionalParams, namedParams]) =>
    ClassWithMethod();

const ClassWithMethodClassMirror =
    ClassMirror(name: 'ClassWithMethod', constructors: {
  '': FunctionMirror(name: '', $call: _ClassWithMethod__Constructor)
}, methods: {
  'someMethod': FunctionMirror(
      positionalParameters: [
        DeclarationMirror(
            name: 'someParameter',
            type: String,
            isRequired: true,
            annotations: [myOtherAnnotation])
      ],
      name: 'someMethod',
      returnType: dynamic,
      annotations: [myOtherAnnotation]),
  'someMethodWithNamedParams': FunctionMirror(
      namedParameters: {
        'someParameter': DeclarationMirror(
            name: 'someParameter',
            type: String,
            isNamed: true,
            annotations: [myOtherAnnotation])
      },
      name: 'someMethodWithNamedParams',
      returnType: dynamic,
      annotations: [myOtherAnnotation])
});
