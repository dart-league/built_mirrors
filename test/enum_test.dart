library built_mirrors.test.enum_test;

import 'package:built_mirrors/built_mirrors.dart';
import 'package:test/test.dart';

part 'enum_test.g.dart';

@reflectable
enum Color {
  GREEN,
  RED,
  BLUE,
  YELLOW
}

main() {
  _initClassMirrors();

  test('enum reflectable', () {
    var colorClassMirror = reflectType(Color);
    expect(colorClassMirror, ColorClassMirror);
    expect(colorClassMirror.values, Color.values);
    expect(colorClassMirror.isEnum, true);
    expect(colorClassMirror.name, 'Color');
    expect(colorClassMirror.toString(), 'ClassMirror on Color');
  });
}