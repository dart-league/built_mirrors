library built_mirrors.example;

import 'package:built_mirrors/built_mirrors.dart';

part 'models.g.dart';

class MyAnnotation extends Annotation {
  final String val1;
  final val2;
  const MyAnnotation(this.val1, {this.val2});
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