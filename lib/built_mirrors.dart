/// Container map of Typ-ClassMirror combination
Map<Type, ClassMirror> _classMirrors;

/// returns the corresponding name of [symbol]
String getSymbolName(Symbol symbol) {
  var symbolStr = symbol.toString();
  return symbolStr.substring(8, symbolStr.length - 2);
}

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
  final List<Annotation> annotations;
  final Map<String, FunctionMirror> constructors;
  final Map<String, DeclarationMirror> fields;
  final List<String> getters;
  final List<String> setters;
  final Map<String, FunctionMirror> methods;

  const ClassMirror({
    this.annotations,
    this.constructors,
    this.fields,
    this.getters,
    this.setters,
    this.methods
  });
}

/// reflects functions declared in a Dart program.
class FunctionMirror {
  final Function call;
  /*Type | List<Type, Type | List<Type> | List<Type, ...>>*/ final returnType;
  final Map<String, DeclarationMirror> parameters;

  const FunctionMirror({this.call, this.returnType, this.parameters});
}

/// reflects attributes declared in a Dart program.
class DeclarationMirror {
  /*Type | List<Type, Type | List<Type> | List<Type, ...>>*/ final type;
  final List<Annotation> annotations;

  const DeclarationMirror({this.type, this.annotations});
}