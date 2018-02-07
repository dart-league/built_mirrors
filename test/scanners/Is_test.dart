library Is_test;

import 'package:built_mirrors_core/built_mirrors.dart';
import 'package:built_mirrors_core/scanners.dart';
import 'package:test/test.dart';

part 'Is_test.g.dart';

class Annotation1 extends Annotation {
  const Annotation1();
}

@reflectable
@Annotation1()
@Annotation1()
class ClassWithAnnotations {}

main() {
  _initMirrors();
  test('', () {
    // ignore: argument_type_not_assignable
    expect(reflectType(ClassWithAnnotations).annotations.where(new Is<Annotation1>()),
        [const Annotation1(), const Annotation1()]);
  });
}