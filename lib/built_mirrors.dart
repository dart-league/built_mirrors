/// Container map of Typ-ClassMirror combination
Map<Type, ClassMirror> _classMirrors;

/// creates a map containing a Map with [Type] as keys and [ClassMirrors] as values
void initClassMirrors(Map<Type, ClassMirror> classMirrors) {
  if (_classMirrors != null) {
    throw new Exception('initClassMirrors function should only be called once');
  }
  _classMirrors = classMirrors;
}

/// Returns the [ClassMirror] corresponding to the [type]
ClassMirror reflectType(Type type) => _classMirrors[type];

/// Returns the [ClassMirror] corresponding to the runtime type of the [instance]
ClassMirror reflect(instance) => _classMirrors[instance.runtimeType];

/// Container map of Function-FunctionMirror combination
Map<Function, FunctionMirror> _functionMirrors;

/// creates a map containing a [Map]<[Function], [FunctionMirror]> as values
void initFunctionMirrors(Map<Function, FunctionMirror> classMirrors) {
  if (_functionMirrors != null) {
    throw new Exception('initFunctionMirrors function should only be called once');
  }
  _functionMirrors = classMirrors;
}

/// Returns the [FunctionMirror] corresponding to the [function]
FunctionMirror reflectFunction(Function function) => _functionMirrors[function];

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

/// Base class for mirrors
abstract class Mirror {

  final String name;

  /// annotations of the element
  final List<Annotation> annotations;

  const Mirror(this.name, this.annotations);
}

/// reflects a Dart language class.
class ClassMirror extends Mirror {
  /// If the class is enum
  final bool isEnum;

  /// If the class mirror is enum  then this will return the values of the enum
  final List values;

  /// Constructors of the class
  final Map<String, FunctionMirror> constructors;

  /// Fields of the class
  final Map<String, DeclarationMirror> fields;

  /// getters of the class
  final List<String> getters;

  /// setters of the class
  final List<String> setters;

  /// methods of the class
  final Map<String, FunctionMirror> methods;

  const ClassMirror({
    String name,
    this.isEnum = false,
    this.values,
    List<Annotation> annotations,
    this.constructors,
    this.fields,
    this.getters,
    this.setters,
    this.methods
  }) : super(name, annotations);

  toString() => 'ClassMirror on $name';
}

typedef FunctionCall(Map<String, dynamic> params);

/// reflects functions declared in a Dart program.
class FunctionMirror extends Mirror {
  /// Used only for constructors. It creates new instances with the map of parameters passed
  final FunctionCall call;

  /// return type of the function
  final /*Type | List<Type, Type | List<Type> | List<Type, ...>>*/ returnType;

  /// parameters of the function
  final Map<String, DeclarationMirror> parameters;

  const FunctionMirror({String name, this.call, this.returnType, this.parameters, List<Annotation> annotations})
      : super(name, annotations);
}

/// reflects attributes declared in a Dart program.
class DeclarationMirror extends Mirror {
  /*Type | List<Type, Type | List<Type> | List<Type, ...>>*/ final type;

  final isFinal;

  final isOptional;

  const DeclarationMirror({String name, this.type, annotations, this.isFinal = false, this.isOptional = false})
      : super(name, annotations);
}