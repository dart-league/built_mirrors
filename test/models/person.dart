library built_mirrors.test.models.person;

import 'package:built_mirrors/built_mirrors.dart';

part 'person.g.dart';


@reflectable
class Person {
  int id;
  String firstName;
  String className;
  DateTime dateOfBirth;
}