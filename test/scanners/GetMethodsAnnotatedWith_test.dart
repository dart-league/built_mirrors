library GetMethodsAnnotatedWith_test;

import 'package:built_mirrors/built_mirrors.dart';
import 'package:built_mirrors/scanners.dart';
import 'package:test/test.dart';

part 'GetMethodsAnnotatedWith_test.g.dart';

class Annotation1 extends Annotation {
  const Annotation1();
}

class Annotation2 extends Annotation {
  const Annotation2();
}

@reflectable
class ObjectWithAnnotatedMethods {

  @Annotation1()
  @Annotation2()
  annotated1() {}

  @Annotation1()
  annotated2() {}
}

main() {
  _initMirrors();
  var o = ObjectWithAnnotatedMethods();
  var cm = reflectType(ObjectWithAnnotatedMethods);

  test('GetMethodsAnnotatedWith', () {
    expect(GetMethodsAnnotatedWith<Annotation1>().from(o), [cm.methods['annotated1'], cm.methods['annotated2']]);

    expect(GetMethodsAnnotatedWith<Annotation2>().from(o), [cm.methods['annotated1']]);
  });
}
