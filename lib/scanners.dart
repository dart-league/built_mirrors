import 'package:built_mirrors/built_mirrors.dart';

/// Creates a new function that checks if the [annotation] is type [T]. For example:
///
///     // Get all the annotations from the class of `object` where they are type `SomeAnnotation`
///     reflect(object).annotations.where(new Is<SomeAnnotation>());
class Is<T> {
  call(Annotation annotation) => annotation is T;
}

///  Get List of methods annotated with [T]. For example:
///
///     class ObjectWithAnnotatedAttr {
///
///       @Annotation1()
///       @Annotation2()
///       var annotated1
///
///       @Annotation1()
///       var annotated2
///     }
///
///     main() {
///       var o = new ObjectWithAnnotatedAttr();
///
///       //should return a list of [DeclarationMirror] of annotated1 and annotated2
///       var methodsAnnotatedWithAnnotation1 = new GetMethodsAnnotatedWith<Annotation1>().from(o);
///
///       //should return a list of [DeclarationMirror] of annotated1
///       var methodsAnnotatedWithAnnotation2 = new GetMethodsAnnotatedWith<Annotation2>().from(o);
class GetMethodsAnnotatedWith<T> {
  ///  Get List of methods annotated with [T]. For example:
  ///
  ///     class ObjectWithAnnotatedAttr {
  ///
  ///       @Annotation1()
  ///       @Annotation2()
  ///       var annotated1
  ///
  ///       @Annotation1()
  ///       var annotated2
  ///     }
  ///
  ///     main() {
  ///       var o = new ObjectWithAnnotatedAttr();
  ///
  ///       //should return a list of [DeclarationMirror] of annotated1 and annotated2
  ///       var methodsAnnotatedWithAnnotation1 = new GetMethodsAnnotatedWith<Annotation1>().from(o);
  ///
  ///       //should return a list of [DeclarationMirror] of annotated1
  ///       var methodsAnnotatedWithAnnotation2 = new GetMethodsAnnotatedWith<Annotation2>().from(o);
  Iterable<FunctionMirror> from(instance) =>
      reflect(instance).methods.values.where((methodMirror) => methodMirror.annotations.any((a) => a is T));
}

///  Get List of variables annotated with [T] from the InstanceMirror [instance]. For example:
///
///     class ObjectWithAnnotatedAttr {
///
///       @Annotation1()
///       @Annotation2()
///       var annotated1
///
///       @Annotation1()
///       var annotated2
///     }
///
///     main() {
///       var o = new ObjectWithAnnotatedAttr();
///
///       // should return a list of [VariableMirror] of annotated1 and annotated2
///       var variablesAnnotatedWithAnnotation1 = new GetFieldsAnnotatedWith<Annotation1>().from(o);
///
///       // should return a list of [VariableMirror] of annotated1
///       var fieldsAnnotatedWithAnnotation2 = new GetFieldsAnnotatedWith<Annotation2>().from(o);
///     }
class GetFieldsAnnotatedWith<T> {
  ///  Get List of variables annotated with [T] from the InstanceMirror [instance]. For example:
  ///
  ///     class ObjectWithAnnotatedAttr {
  ///
  ///       @Annotation1()
  ///       @Annotation2()
  ///       var annotated1
  ///
  ///       @Annotation1()
  ///       var annotated2
  ///     }
  ///
  ///     main() {
  ///       var o = new ObjectWithAnnotatedAttr();
  ///
  ///       // should return a list of [VariableMirror] of annotated1 and annotated2
  ///       var variablesAnnotatedWithAnnotation1 = new GetFieldsAnnotatedWith<Annotation1>().from(o);
  ///
  ///       // should return a list of [VariableMirror] of annotated1
  ///       var fieldsAnnotatedWithAnnotation2 = new GetFieldsAnnotatedWith<Annotation2>().from(o);
  ///     }
  Iterable<DeclarationMirror> from(instance) =>
      reflect(instance).fields.values.where((methodMirror) => methodMirror.annotations.any((a) => a is T));
}

/// Get the list of public [MethodMirror] from [classMirror]
Map<String, FunctionMirror> getPublicMethodsFromClass(ClassMirror classMirror) {
  var methods = <String, FunctionMirror>{};
  classMirror.methods.forEach((key, method) {
    if (!key.startsWith('_')) methods[key] = method;
  });
  return methods;
}

/// Get the list of public variables [DeclarationMirror] and setters from [classMirror]
Map<String, DeclarationMirror> getPublicSettersFrom(ClassMirror classMirror) {
  var publicSetters = <String, DeclarationMirror>{};
  classMirror.setters.forEach((setter) {
    if (!setter.startsWith('_')) publicSetters[setter] = classMirror.fields[setter];
  });
  return publicSetters;
}

/// Get the list of public variables [DeclarationMirror] and setters from [classMirror]
Map<String, DeclarationMirror> getPublicGettersFrom(ClassMirror classMirror) {
  var publicGetters = <String, DeclarationMirror>{};
  classMirror.getters.forEach((getter) {
    if (!getter.startsWith('_')) publicGetters[getter] = classMirror.fields[getter];
  });
  return publicGetters;
}

/// Get the list of public variables [DeclarationMirror] from [classMirror]
Map<String, DeclarationMirror> getPublicFieldsFrom(ClassMirror classMirror) {
  var publicFields = <String, DeclarationMirror>{};
  var fields = classMirror.getters.where((getter) => classMirror.setters.contains(getter));
  fields.forEach((getter) {
    if (!getter.startsWith('_')) publicFields[getter] = classMirror.fields[getter];
  });
  return publicFields;
}

/// Gets the instance of the class that extends the [classMirror] from the classes annotated with `@reflectable`, for example:
///
/// If we have next Abstract class:
///
///     abstract class SomeService {
///       String someMethod();
///     }
///
/// The Extension level of the next service is 1
///
///     class SomeServiceImpl implements SomeService {
///       String someMethod() => 'someMethod';
///     }
///
/// And the Extension level of the next service is 2
///
///     class SomeServiceImpl2 extens SomeServiceImpl {
///       String someMethod() => super.someMethod() + '2';
///     }
///
/// So that, this method will return an instance of `SomeServiceImpl2`
Object getObjectThatExtend(ClassMirror classMirror) {
  ClassMirror result;
  int counter = 0,
      counter2 = 0;
  for (Type type in classMirrors.keys) {
    counter = _getExtensionLevel(classMirror, type, counter);
    if (counter > 0 && counter2 < counter) {
      result = reflectType(type);
      counter2 = counter;
      counter = 0;
    }
  }

  return result.constructors[''].call({});
}

/// Get the level value that a [subType] extends the [superClassCM], for example:
///
/// If we have next Abstract class:
///
///     abstract class SomeService {
///       String someMethod();
///     }
///
/// The Extension level of the next service is 1
///
///     class SomeServiceImpl implements SomeService {
///       String someMethod() => 'someMethod';
///     }
///
/// And the Extension level of the next service is 2
///
///     class SomeServiceImpl2 extens SomeServiceImpl {
///       String someMethod() => super.someMethod() + '2';
///     }
int _getExtensionLevel(ClassMirror superClassCM, Type subType, int counter) {
  if (subType == Object) return 0;

  var subTypeCM = reflectType(subType);
  if (subTypeCM == null) return 0;

  counter++;
  if (!(subTypeCM.superinterfaces.any((si) => reflectType(si) == superClassCM)
      || reflectType(subTypeCM.superclass) == superClassCM)) {
    counter = _getExtensionLevel(superClassCM, subTypeCM.superclass, counter);
  }

  return counter;
}
