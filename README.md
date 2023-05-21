# built\_mirrors

![Build
Status](https://travis-ci.org/dart-league/built_mirrors.svg?branch=master)

This is a library that generates `ClassMirror` from classes annotated
with `@reflectable` or `@Reflectable()`.

## Getting Started

1 - Create a new dart-web project. 2 - add `built_mirrors` dependency to
your `pubspec.yaml`.

``` yaml
...
dependencies:
  ...
  # replace for the latest version
  built_mirrors: any
  ...
dev_dependencies:
  ...
  # replace for the latest version
  built_runner: any
  ...
```

3 - create a file in `bin` folder called `models.dart` and put next code
on it:

``` dart
library built_mirrors.example.models;

import 'package:built_mirrors/built_mirrors.dart';

part 'models.g.dart';

class MyAnnotation extends Annotation {
  final String val1;
  final val2;
  const MyAnnotation(this.val1, {this.val2});
}

const myOtherAnnotation = _MyOtherAnnotation();
class _MyOtherAnnotation extends Annotation {
  const _MyOtherAnnotation();
}

@reflectable
class Person {
  Person({this.id, this.name, this.myDynamic, this.cars});
  int id;
  @MyAnnotation('hello\uabcd', val2: null)
  String name;
  var myDynamic;
  List<Car> cars;

  String get myGetter => 'myGetter result';
  set mySetter(String val) => 'setting $val';
}

@reflectable
@myOtherAnnotation
class Car {
  int id;
  @MyAnnotation(r'\uabcd', val2: null)
  String engine;
  Car([this.id, this.engine]);
}

@reflectable
class EmptyClass {

}

@reflectable
class ExtendedPerson extends Person {
  var extendedName;
  var otherExtended;
}

@reflectable
class ClassWithMethod {

  @myOtherAnnotation
  someMethod(@myOtherAnnotation String someParameter) {
    return 'someMethod';
  }

  @myOtherAnnotation
  someMethodWithNamedParams({@myOtherAnnotation String someParameter}) {
    return 'someMethod';
  }
}
```

4 - edit the file `main.dart` in the folder `bin` and put next code on
it:

``` dart
library built_mirrors.example.main;

import 'models.dart';
import 'package:built_mirrors/built_mirrors.dart';

part 'main.g.dart';

@reflectable
@AnnotationWithFunction(otherFunction)
String someFunction(@myOtherAnnotation int p1, int p0, int p2) {
  return '';
}

otherFunction() {}

class AnnotationWithFunction extends Annotation {
  const AnnotationWithFunction(this.function);

  final Function function;
}

main() {

  // Initializes the mirrors map
  _initMirrors();

  // Gets the PersonClassMirror
  var personClassMirror = reflectType(Person);
  // and then constructs a new person using a map with the
  // needed parameters for the constructor
  var p1 = personClassMirror.constructors['']([], {'id': 1, 'name': 'person 1'});
  // Get the list of DeclarationMirror corresponding to the fields of Person class
  var p1Fields = personClassMirror.fields;

  // prints: `p1Fields['myDynamic'].type: dynamic}\n` in the `result` element
  print("p1Fields['myDynamic'].type: ${p1Fields['myDynamic'].type}\n");
  // prints: `p1Fields['cars'].type: [List, Car]}\n` in the `result` element
  print("p1Fields['cars'].type: ${p1Fields['cars'].type}\n");

  // Gets the CarClassMirror and constructs a new car using the default constructor
  // passing a map containing the required parameters
  Car car1 = reflectType(Car).constructors['']([1, 'v8']);
  /* prints:
      car1:
        id: 1
        engine: v8
   */
  print('car1:\n\tid: ${car1.id}\n\tengine: ${car1.engine}\n');

  // adds car1 to p1.cars
  p1.cars = [car1];

  print('\n--------------------------');
  print('reflecting "ClassWithMethod"');
  print('--------------------------');
  var methods = reflectType(ClassWithMethod).methods;
  print(methods.keys); // prints: 'someFunction'
  print(methods['someMethod'].returnType); // prints: String
  print(methods['someMethod'].annotations); // prints: [Instance of '_MyOtherAnnotation']
  print(methods['someMethod'].positionalParameters); // prints: {p1: Instance of 'DeclarationMirror'}
  print(methods['someMethod'].positionalParameters[0].annotations); // prints: [Instance of '_MyOtherAnnotation']
  print(methods['someMethod'].positionalParameters[0].type); // prints: int

  print('\n--------------------------');
  print('reflecting "someFunction"');
  print('--------------------------');
  var sfMirror = reflectFunction(someFunction);
  print(sfMirror.name); // prints: '(someMethod)'
  print(sfMirror.returnType); // prints: dynamic
  print(sfMirror.annotations); // prints: [Instance of '_MyOtherAnnotation']
  print(sfMirror.positionalParameters); // prints: {someParameter: Instance of 'DeclarationMirror'}
  print(sfMirror.positionalParameters[0].annotations); // prints: [Instance of '_MyOtherAnnotation']
  print(sfMirror.positionalParameters[0].type); // prints: String
  print(sfMirror.positionalParameters[0].name);
  print(sfMirror.positionalParameters[1].name);
  print(sfMirror.positionalParameters[2].name);
}
```

5 - run `dart run build_runner build`. Then you will see that the files
`bin/models.g.dart` and `bin/main.g.dart` have been generated and they
will contain the next code:

``` dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_mirrors.example.main;

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
```

and:

``` dart
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
    DeclarationMirror(name: 'myGetter', type: String);
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
  'id',
  'name',
  'myDynamic',
  'cars',
  'myGetter'
], setters: [
  'id',
  'name',
  'myDynamic',
  'cars',
  'mySetter'
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
      'id',
      'name',
      'myDynamic',
      'cars',
      'myGetter'
    ],
    setters: [
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
```

6 - Finally you can run the file `bin/main.dart` and if everything is ok
you will see next output in console:

    p1Fields['myDynamic'].type: dynamic
    
    p1Fields['cars'].type: [List, Car]
    
    car1:
        id: 1
        engine: v8
    
    
    --------------------------
    reflecting "ClassWithMethod"
    --------------------------
    (someMethod, someMethodWithNamedParams)
    dynamic
    [Instance of '_MyOtherAnnotation']
    [DeclarationMirror on someParameter]
    [Instance of '_MyOtherAnnotation']
    String
    
    --------------------------
    reflecting "someFunction"
    --------------------------
    someFunction
    String
    [Instance of 'AnnotationWithFunction']
    [DeclarationMirror on p1, DeclarationMirror on p0, DeclarationMirror on p2]
    [Instance of '_MyOtherAnnotation']
    int
    p1
    p0
    p2
