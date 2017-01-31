# built_mirrors

This is a library that generates `ClassMirror` from classes annotated with
`@reflectable` or `@Reflectable()`.

## Getting Started

1. Create a new dart-web project.
2. add `built_mirrors` dependency to your `pubspec.yaml`.

```yaml
...
dependencies:
  ...
  built_mirrors: any
  ...
```

3. create a file in `bin` folder called `models.dart` and put next code on it:

```dart
library built_mirrors.example.models;

import 'package:built_mirrors/built_mirrors.dart';

part 'models.g.dart';

class MyAnnotation extends Annotation {
  final String val1;
  final val2;
  const MyAnnotation(this.val1, {this.val2});
}

const myOtherAnnotation = const _MyOtherAnnotation();
class _MyOtherAnnotation extends Annotation {
  const _MyOtherAnnotation();
}

@reflectable
class Person {
  Person({this.id, this.name, this.myDynamic, this.cars});
  int id;
  @MyAnnotation('hello', val2: null)
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
```

4. edit the file `main.dart` in the folder `bin` and put next code on it:

```dart
library built_mirrors.example.main;

import 'models.dart';
import 'package:built_mirrors/built_mirrors.dart';

part 'main.g.dart';

main() {

  // Initializes the `Type-ClassMirror` map
  _initClassMirrors();

  // Gets the PersonClassMirror
  var personClassMirror = reflectType(Person);
  // and then constructs a new person using a map with the
  // needed parameters for the constructor
  var p1 = personClassMirror.constructors[''].call({'id': 1, 'name': 'person 1'});
  // Get the list of DeclarationMirror corresponding to the fields of Person class
  var p1Fields = personClassMirror.fields;

  // prints: `p1Fields['myDynamic'].type: dynamic}\n` in the `result` element
  print("p1Fields['myDynamic'].type: ${p1Fields['myDynamic'].type}\n");
  // prints: `p1Fields['cars'].type: [List, Car]}\n` in the `result` element
  print("p1Fields['cars'].type: ${p1Fields['cars'].type}\n");

  // Gets the CarClassMirror and constructs a new car using the default constructor
  // passing a map containing the required parameters
  Car car1 = reflectType(Car).constructors[''].call({'id': 1, 'engine': 'v8'});
  /* prints:
      car1:
        id: 1
        engine: v8
   */
  print('car1:\n\tid: ${car1.id}\n\tengine: ${car1.engine}\n');

  // adds car1 to p1.cars
  p1.cars = [car1];
}

```

5. create a file in `tool` folder called `build.dart` and put next code on it:

```dart
import 'package:build_runner/build_runner.dart';
import 'package:built_mirrors/phase.dart';


main() async {
  await build(new PhaseGroup()
    ..addPhase(
    // In next line replace `built_mirrors` for the name of your package
    // and `example/*.dart` for the globs you want to use as input, for example `**/*.dart`
    // to take all the dart files of the project as input.
        builtMirrorsPhase('built_mirrors', const ['example/*.dart'])),
      deleteFilesByDefault: true);
}
```

6. run `tool/build.dart`. Then you will see that the file `bin/models.g.dart`
has been generated and it will contains the next code:

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_mirrors.example.models;

// **************************************************************************
// Generator: ClassMirrorsGenerator
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
const $$Person_fields_myGetter =
    const DeclarationMirror(type: String, isFinal: true);
const $$Person_fields_mySetter = const DeclarationMirror(type: String);

const PersonClassMirror =
    const ClassMirror(name: 'Person', constructors: const {
  '': const FunctionMirror(parameters: const {
    'id': const DeclarationMirror(type: int, isOptional: true),
    'name': const DeclarationMirror(type: String, isOptional: true),
    'myDynamic': const DeclarationMirror(type: dynamic, isOptional: true),
    'cars': const DeclarationMirror(type: const [List, Car], isOptional: true)
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
// Generator: ClassMirrorsGenerator
// Target: class Car
// **************************************************************************

_Car__Constructor(params) => new Car(params['id'], params['engine']);

const $$Car_fields_id = const DeclarationMirror(type: int);
const $$Car_fields_engine = const DeclarationMirror(type: String);

const CarClassMirror = const ClassMirror(name: 'Car', constructors: const {
  '': const FunctionMirror(parameters: const {
    'id': const DeclarationMirror(type: int, isOptional: true),
    'engine': const DeclarationMirror(type: String, isOptional: true)
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

// **************************************************************************
// Generator: ClassMirrorsGenerator
// Target: class EmptyClass
// **************************************************************************

_EmptyClass__Constructor(params) => new EmptyClass();

const EmptyClassClassMirror =
    const ClassMirror(name: 'EmptyClass', constructors: const {
  '': const FunctionMirror(parameters: const {}, call: _EmptyClass__Constructor)
});

// **************************************************************************
// Generator: ClassMirrorsGenerator
// Target: class ExtendedPerson
// **************************************************************************

_ExtendedPerson__Constructor(params) => new ExtendedPerson();

const $$ExtendedPerson_fields_extendedName =
    const DeclarationMirror(type: dynamic);
const $$ExtendedPerson_fields_otherExtended =
    const DeclarationMirror(type: dynamic);

const ExtendedPersonClassMirror =
    const ClassMirror(name: 'ExtendedPerson', constructors: const {
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

```

7. Finally you can run the file `bin/main.dart`. If everything is ok you will see next
output in console:

```
p1Fields['myDynamic'].type: dynamic

p1Fields['cars'].type: [List, Car]

car1:
	id: 1
	engine: v8
```

# TODO

- [ ] add `initClassMirrors` generator based on `main` function