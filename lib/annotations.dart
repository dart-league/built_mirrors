part of built_mirrors_core;

/**
 * Annotation class to describe properties of a class member.
 */
class SerializedName {
  final String name;

  const SerializedName(this.name);

  String toString() => "Property: Name: ${name}";
}

/// Annotation needed to generate [ClassMirror] for every class
const Reflectable reflectable = Reflectable();

/// Annotation needed to generate [ClassMirror] for every class
class Reflectable {
  const Reflectable();
}
