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
  int? id;
  @MyAnnotation('hello\uabcd', val2: null)
  String? name;
  var myDynamic;
  List<Car>? cars;

  String get myGetter => 'myGetter result';
  set mySetter(String val) => 'setting $val';
}

@reflectable
@myOtherAnnotation
class Car {
  int? id;
  @MyAnnotation(r'\uabcd', val2: null)
  String? engine;
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
  someMethodWithNamedParams({@myOtherAnnotation String? someParameter}) {
    return 'someMethod';
  }
}
