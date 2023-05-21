library GetVarialbesAndGettersTest_test;

import 'package:built_mirrors/built_mirrors.dart';
import 'package:test/test.dart';
import 'package:built_mirrors/scanners.dart';

part 'GetPublicMembers_test.g.dart';

@reflectable
class ObjectWithMembers {
  String? name;
  int? age;
}

@reflectable
class ExtendedObject extends ObjectWithMembers {
  String? myProp;
}

main() {
  _initMirrors();
  group('Get public getters ->', () {
    test('test1', () {
      expect(getPublicGettersFrom(reflectType(ObjectWithMembers)!)?.length, 2);
    });

    test('test2', () {
      expect(getPublicGettersFrom(reflectType(ExtendedObject)!)?.length, 3);
    });
  });
  group('Get public setters ->', () {
    test('test1', () {
      expect(getPublicSettersFrom(reflectType(ObjectWithMembers)!)?.length, 2);
    });

    test('test2', () {
      expect(getPublicSettersFrom(reflectType(ExtendedObject)!)?.length, 3);
    });
  });
  group('Get public fields ->', () {
    test('test1', () {
      expect(getPublicFieldsFrom(reflectType(ObjectWithMembers)!)?.length, 2);
    });

    test('test2', () {
      expect(getPublicFieldsFrom(reflectType(ExtendedObject)!)?.length, 3);
    });
  });
}
