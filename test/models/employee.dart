library built_mirrors.test.models.employee;

import 'package:built_mirrors_core/built_mirrors.dart';

import 'person.dart';

part 'employee.g.dart';

@reflectable
class Employee extends Person {
  num salary;
}