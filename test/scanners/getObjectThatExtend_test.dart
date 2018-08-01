library getObjectThatExtend_test;

import 'package:built_mirrors_core/built_mirrors.dart';
import 'package:test/test.dart';
import 'package:built_mirrors_core/scanners.dart';

part 'getObjectThatExtend_test.g.dart';

@reflectable
abstract class Service1 {}

@reflectable
class Service1Impl implements Service1 {}


@reflectable
abstract class Service2 {}

@reflectable
class Service2Impl implements Service2 {}

@reflectable
class Service22Impl extends Service2Impl {}


main() {
  _initMirrors();
  test('Get Object that extends 1 level', () {

    var service1Cm = classMirrors.values.singleWhere((cm) => cm.name == 'Service1');

    expect(getObjectThatExtend(service1Cm), new TypeMatcher<Service1Impl>());
  });


  test('Get Object that extends 2 levels', () {

    var service2ImplCm = classMirrors.values.singleWhere((cm) => cm.name == 'Service2');

    expect(getObjectThatExtend(service2ImplCm), new TypeMatcher<Service22Impl>());
  });
}