/// Container map of [Type]-[ClassMirror] combination
Map<Type, ClassMirror> _classMirrors = {};

/// returns the map of [Type]-[ClassMirror]
Map<Type, ClassMirror> get classMirrors => _classMirrors;

/// adds to a map containing a Map with [Type] as keys and [ClassMirrors] as values
void initClassMirrors(Map<Type, ClassMirror> classMirrors) {
  _classMirrors.addAll(classMirrors);
}

/// Returns the [ClassMirror] corresponding to the [type]
ClassMirror reflectType(Type type) => _classMirrors[type];

/// Returns the [ClassMirror] corresponding to the runtime type of the [instance]
ClassMirror reflect(instance) => _classMirrors[instance.runtimeType];

/// Container map of Function-FunctionMirror combination
Map<Function, FunctionMirror> _functionMirrors = {};

/// returns the map of Function-FunctionMirror combination
Map<Function, FunctionMirror> get functionMirrors => _functionMirrors;

/// adds to a map containing a [Map]<[Function], [FunctionMirror]> as values
void initFunctionMirrors(Map<Function, FunctionMirror> classMirrors) {
  _functionMirrors.addAll(classMirrors);
}

/// Returns the [FunctionMirror] corresponding to the [function]
FunctionMirror reflectFunction(Function function) => _functionMirrors[function];

/// Annotation needed to generate [ClassMirror] for every class
const Reflectable reflectable = const Reflectable();

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

  /// super-class of the class
  final Type superclass;

  final List<Type> superinterfaces;

  final bool isAbstract;

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
    this.isEnum: false,
    this.values,
    List<Annotation> annotations,
    this.constructors,
    this.fields,
    this.getters,
    this.setters,
    this.methods,
    this.superclass: Object,
    this.superinterfaces: const [],
    this.isAbstract: false
  }) : super(name, annotations);

  toString() => 'ClassMirror on $name';
}

typedef FunctionCall([List positionalParams, Map<String, dynamic> namedParams]);

Map<FunctionMirror, List<DeclarationMirror>> _parametersFunctionMirrorCache = {};

/// reflects functions declared in a Dart program.
class FunctionMirror extends Mirror {
  /// Used only for constructors. It creates new instances with the map of parameters passed
  final FunctionCall $call;

  /// Used only for constructors. It creates new instances with the map of parameters passed
  call([List positionalParams, Map<String, dynamic> namedParams]) => $call(positionalParams, namedParams);

  /// return type of the function
  final /*Type | List<Type, Type | List<Type> | List<Type, ...>>*/ returnType;

  /// positional parameters of the function
  final List<DeclarationMirror> positionalParameters;

  /// parameters of the function
  final Map<String, DeclarationMirror> namedParameters;

  List<DeclarationMirror> get parameters =>
      (
          _parametersFunctionMirrorCache
            ..putIfAbsent(this, () => []..addAll(positionalParameters ?? [])..addAll(namedParameters?.values ?? []))
      )[this];

  const FunctionMirror({
    String name,
    this.$call,
    this.returnType,
    this.positionalParameters,
    this.namedParameters,
    List<Annotation> annotations})
      : super(name, annotations);

  toString() => 'FunctionMirror on $name';
}

/// reflects attributes declared in a Dart program.
class DeclarationMirror extends Mirror {
  /// Returns the type of the attribute, for example:
  ///
  ///     String                  ->  returns String
  ///     List<String>            ->  returns [List, [String]]
  ///     Map<String, int>        ->  returns [Map, [String, int]]
  ///     Map<String, List<int>>  ->  returns [Map, [List, [int]]]
  final /*Type | List<Type, Type | List<Type> | List<Type, ...>>*/ type;

  /// Determines if the attribute is final
  final bool isFinal;

  /// Determines if the attribute is required
  final bool isRequired;

  /// Determines if the attribute is named
  final bool isNamed;

  const DeclarationMirror({
    String name,
    this.type, annotations,
    this.isFinal: false,
    this.isRequired: false,
    this.isNamed = false
  }) : super(name, annotations);

  toString() => 'DeclarationMirror on $name';
}
