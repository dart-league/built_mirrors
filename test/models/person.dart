library built_mirrors.test.models.person;

import 'package:built_mirrors_core/built_mirrors.dart';

part 'person.g.dart';


@reflectable
class Person {
  int id;
  String firstName;
  String className;
  DateTime dateOfBirth;
}