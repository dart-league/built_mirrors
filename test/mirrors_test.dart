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

class AnnotationWithFunction extends Annotation {
  const AnnotationWithFunction(this.function);

  final Function function;
}

someFunction() {}

@reflectable
@AnnotationWithFunction(someFunction)
class ClassWithAnnotationWithFunction {}

class AnnotationWithList extends Annotation {
  final List<String> myList;

  const AnnotationWithList(this.myList);
}

@reflectable
@AnnotationWithList(const ['hello', 'hi'])
class ClassWithAnnotationWithList {}

class AnnotationWithMap extends Annotation {
  final Map<String, String> myMap;

  const AnnotationWithMap(this.myMap);
}

@reflectable
@AnnotationWithMap(const {'k1': 'v1', 'k2': 'v2'})
class ClassWithAnnotationWithMap {}

class SomeConstant {
  final String name;

  const SomeConstant(this.name);
}

class AnnotationWithConstant extends Annotation {
  final SomeConstant someConstant;
  final SomeConstant otherConstant;

  const AnnotationWithConstant(this.someConstant, {this.otherConstant});
}

@reflectable
@AnnotationWithConstant(
    const SomeConstant('my-constant'),
    otherConstant: const SomeConstant('other-constant')
)
class ClassWithAnnotationWithConstant {}


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

  test('class with annotation with function', () {
    var cm = reflectType(ClassWithAnnotationWithFunction);
    AnnotationWithFunction annotationWithFunction = cm.annotations[0];
    expect(annotationWithFunction, new isInstanceOf<AnnotationWithFunction>());
    expect(annotationWithFunction.function, someFunction);
  });

  test('class with annotation with list', () {
    var cm = reflectType(ClassWithAnnotationWithList);
    AnnotationWithList annotationWithList = cm.annotations[0];
    expect(annotationWithList, new isInstanceOf<AnnotationWithList>());
    expect(annotationWithList.myList, const ['hello', 'hi']);
  });

  test('class with annotation with map', () {
    var cm = reflectType(ClassWithAnnotationWithMap);
    AnnotationWithMap annotationWithMap = cm.annotations[0];
    expect(annotationWithMap, new isInstanceOf<AnnotationWithMap>());
    expect(annotationWithMap.myMap, const {'k1': 'v1', 'k2': 'v2'});
  });

  test('class with annotation with constant', () {
    var cm = reflectType(ClassWithAnnotationWithConstant);
    AnnotationWithConstant annotationWithConstant = cm.annotations[0];
    expect(annotationWithConstant, new isInstanceOf<AnnotationWithConstant>());
    expect(annotationWithConstant.someConstant, const SomeConstant('my-constant'));
    expect(annotationWithConstant.otherConstant, const SomeConstant('other-constant'));
  });
}
