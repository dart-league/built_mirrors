library built_mirrors.example.simple_test;

import 'package:built_mirrors/built_mirrors.dart';
import 'package:test/test.dart';

part 'simple_test.g.dart';

@reflectable
class SimpleTest {}

main() {
  _initMirrors();

  test('simple test', () {

  });
}