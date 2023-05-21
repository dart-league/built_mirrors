library GetFieldsAnnotatedWith_test;

import 'package:built_mirrors/built_mirrors.dart';
import 'package:built_mirrors/scanners.dart';
import 'package:test/test.dart';

part 'GetFieldsAnnotatedWith_test.g.dart';

class Annotation1 extends Annotation {
  const Annotation1();
}

class Annotation2 extends Annotation {
  const Annotation2();
}

@reflectable
class ObjectWithAnnotatedFields {

  @Annotation1()
  @Annotation2()
  var annotated1;

  @Annotation1()
  var annotated2;
}

main() {
  _initMirrors();
  var o = ObjectWithAnnotatedFields();
  var cm = reflectType(ObjectWithAnnotatedFields);

  test('GetMethodsAnnotatedWith', () {
    expect(GetFieldsAnnotatedWith<Annotation1>().from(o), [cm?.fields?['annotated1'], cm?.fields?['annotated2']]);

    expect(GetFieldsAnnotatedWith<Annotation2>().from(o), [cm?.fields?['annotated1']]);
  });
}
