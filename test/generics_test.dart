library built_mirrors.example.generics_test;

import 'package:built_mirrors/built_mirrors.dart';
import 'package:test/test.dart';

part 'generics_test.g.dart';

@reflectable
class NoGeneric {}

@reflectable
class Generic1<T> {
  List<T> mList;
}

@reflectable
class Generic2<T1, T2> {
  Map<T1, T2> mMap;
}

main() {
  _initMirrors();

  group('generics: ', () {
    test('reflectType', () {
      expect(reflectType(NoGeneric), NoGenericClassMirror);
      expect(reflectType(Generic1), Generic1ClassMirror);
      expect(reflectType(Generic2), Generic2ClassMirror);
    });

    test('reflect', () {
      expect(reflect(new NoGeneric()), NoGenericClassMirror);
      expect(reflect(new Generic1<String>()), Generic1ClassMirror);
      expect(reflect(new Generic2<String, NoGeneric>()), Generic2ClassMirror);
    });
  });
}