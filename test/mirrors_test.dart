library built_mirrors.test.enum_test;

import 'package:built_mirrors/built_mirrors.dart';
import 'package:test/test.dart';

part 'mirrors_test.g.dart';

@reflectable
enum Color {
  GREEN,
  RED,
  BLUE,
  YELLOW
}

class SomeAnnotation extends Annotation {
  const SomeAnnotation();
}

@reflectable
class ClassWithMethods {

  methodNoReturnTypeNoParams() {}

  methodNoReturnTypeWithParams(String param1) {}

  @SomeAnnotation()
  methodWithAnnotation() {}

  methodWithAnnotatedParams(@SomeAnnotation() p1) {}

  String methodWithReturnTypeAndParams(String b, int c) => '';
}

main() {
  _initMirrors();

  test('enum', () {
    var colorClassMirror = reflectType(Color);
    expect(colorClassMirror, ColorClassMirror);
    expect(colorClassMirror.values, Color.values);
    expect(colorClassMirror.isEnum, true);
    expect(colorClassMirror.name, 'Color');
    expect(colorClassMirror.toString(), 'ClassMirror on Color');
  });

  test('class with methods', () {
    var cm = reflectType(ClassWithMethods);
    expect(cm, ClassWithMethodsClassMirror);
    expect(cm.methods.keys, [
      'methodNoReturnTypeNoParams',
      'methodNoReturnTypeWithParams',
      'methodWithAnnotation',
      'methodWithAnnotatedParams',
      'methodWithReturnTypeAndParams'
    ]);

    var methodNoReturnTypeNoParamsMirror = cm.methods['methodNoReturnTypeNoParams'];
    expect(methodNoReturnTypeNoParamsMirror.parameters, null);
    expect(methodNoReturnTypeNoParamsMirror.annotations, null);
    expect(methodNoReturnTypeNoParamsMirror.returnType, dynamic);

    var methodNoReturnTypeWithParams = cm.methods['methodNoReturnTypeWithParams'];
    expect(methodNoReturnTypeWithParams.parameters.keys.elementAt(0), 'param1');
    expect(methodNoReturnTypeWithParams.annotations, null);
    expect(methodNoReturnTypeWithParams.returnType, dynamic);

    var methodWithAnnotation = cm.methods['methodWithAnnotation'];
    expect(methodWithAnnotation.parameters, null);
    expect(methodWithAnnotation.annotations[0], new isInstanceOf<SomeAnnotation>());
    expect(methodWithAnnotation.returnType, dynamic);

    var methodWithAnnotatedParams = cm.methods['methodWithAnnotatedParams'];
    expect(methodWithAnnotatedParams.parameters['p1'].annotations[0], new isInstanceOf<SomeAnnotation>());
    expect(methodWithAnnotatedParams.annotations, null);
    expect(methodWithAnnotatedParams.returnType, dynamic);

    var methodWithReturnTypeAndParams = cm.methods['methodWithReturnTypeAndParams'];
    expect(methodWithReturnTypeAndParams.parameters.keys, ['b', 'c']);
    expect(methodWithReturnTypeAndParams.annotations, null);
    expect(methodWithReturnTypeAndParams.returnType, String);
  });
}