library built_mirrors.test.models.student;

import 'course.dart';
import 'package:built_mirrors/built_mirrors.dart';
import 'person.dart';

part 'student.g.dart';

@reflectable
class Student extends Person {
  String studentId;

  List<Course> courses;
}
