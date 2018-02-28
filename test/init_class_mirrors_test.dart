library built_mirrors.test.init_class_mirrors_test;

import 'models/models.dart';
import 'package:built_mirrors_core/built_mirrors.dart';
import 'package:test/test.dart';

part 'init_class_mirrors_test.g.dart';

main() {
  _initMirrors();

  test('initClassMirrors', () {
    expect(reflectType(Student), StudentClassMirror);
    expect(reflectType(Course), CourseClassMirror);
    expect(reflectType(Person), PersonClassMirror);
    expect(reflectType(Employee), EmployeeClassMirror);
  });
}