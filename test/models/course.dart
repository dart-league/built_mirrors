library built_mirrors.test.models.course;

import 'package:built_mirrors/built_mirrors.dart';

part 'course.g.dart';

@reflectable
class Course {
  int id;

  String name;

  num credits;
}