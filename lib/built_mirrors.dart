/// Container map of Typ-ClassMirror combination
Map<Type, ClassMirror> _classMirrors;

/// creates a map containing a Map with [Type] as keys and [ClassMirrors] as values
void initClassMirrors(Map<Type, ClassMirror> classMirrors) {
  if(_classMirrors != null) {
    throw new Exception('initClassMirror function should only be called once');
  }
  _classMirrors = classMirrors;
}

/// Returns the [ClassMirror] corresponding to the [type]
ClassMirror reflectType(Type type) => _classMirrors[type];

/// Annotation needed to generate [ClassMirror] for every class
const reflectable = const Reflectable();

/// Annotation needed to generate [ClassMirror] for every class
class Reflectable {
  const Reflectable();
}

/// Class used to make annotations listed on [ClassMirror]
abstract class Annotation {
  const Annotation();
}

/// reflects a Dart language class.
class ClassMirror {
  /// name of the class
  final String name;

  /// If the class is enum
  final bool isEnum;

  /// If the class mirror is enum  then this will return the values of the enum
  final List values;
  final List<Annotation> annotations;
  final Map<String, FunctionMirror> constructors;
  final Map<String, DeclarationMirror> fields;
  final List<String> getters;
  final List<String> setters;
  final Map<String, FunctionMirror> methods;

  const ClassMirror({
    this.name,
    this.isEnum = false,
    this.values,
    this.annotations,
    this.constructors,
    this.fields,
    this.getters,
    this.setters,
    this.methods
  });

  toString() => 'ClassMirror on $name';
}

typedef FunctionCall(Map<String, dynamic> params);

/// reflects functions declared in a Dart program.
class FunctionMirror {
  final FunctionCall call;
  /*Type | List<Type, Type | List<Type> | List<Type, ...>>*/ final returnType;
  final Map<String, DeclarationMirror> parameters;

  const FunctionMirror({this.call, this.returnType, this.parameters});
}

/// reflects attributes declared in a Dart program.
class DeclarationMirror {
  /*Type | List<Type, Type | List<Type> | List<Type, ...>>*/ final type;
  final List<Annotation> annotations;

  final isFinal;

  final isOptional;

  const DeclarationMirror({this.type, this.annotations, this.isFinal = false, this.isOptional = false});
}