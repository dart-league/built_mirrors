library built_mirrors.serialized_name;

import 'package:built_mirrors/built_mirrors.dart';
import 'package:test/test.dart';

part 'serialized_namde_test.g.dart';

@reflectable
class ClassWithSerializedName {
  @SerializedName('the_renamed')
  var renamed;
}

main() {
  _initMirrors();

  test('class with SerializedName annotation', () {
    var m = reflectType(ClassWithSerializedName);
    expect(m.fields.containsKey('the_renamed'), true);
    expect(m.getters.contains('the_renamed'), true);
    expect(m.setters.contains('the_renamed'), true);
  });
}