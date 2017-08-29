library built_mirrors.example.main;

import 'models.dart';
import 'package:built_mirrors/built_mirrors.dart';

part 'main.g.dart';

@reflectable
@AnnotationWithFunction(otherFunction)
String someFunction(@myOtherAnnotation int p1, int p0, int p2) {
  return '';
}

otherFunction() {}

class AnnotationWithFunction extends Annotation {
  const AnnotationWithFunction(this.function);

  final Function function;
}

main() {

  // Initializes the mirrors map
  _initMirrors();

  // Gets the PersonClassMirror
  var personClassMirror = reflectType(Person);
  // and then constructs a new person using a map with the
  // needed parameters for the constructor
  var p1 = personClassMirror.constructors[''].call({'id': 1, 'name': 'person 1'});
  // Get the list of DeclarationMirror corresponding to the fields of Person class
  var p1Fields = personClassMirror.fields;

  // prints: `p1Fields['myDynamic'].type: dynamic}\n` in the `result` element
  print("p1Fields['myDynamic'].type: ${p1Fields['myDynamic'].type}\n");
  // prints: `p1Fields['cars'].type: [List, Car]}\n` in the `result` element
  print("p1Fields['cars'].type: ${p1Fields['cars'].type}\n");

  // Gets the CarClassMirror and constructs a new car using the default constructor
  // passing a map containing the required parameters
  Car car1 = reflectType(Car).constructors[''].call({'id': 1, 'engine': 'v8'});
  /* prints:
      car1:
        id: 1
        engine: v8
   */
  print('car1:\n\tid: ${car1.id}\n\tengine: ${car1.engine}\n');

  // adds car1 to p1.cars
  p1.cars = [car1];

  print('\n--------------------------');
  print('reflecting "ClassWithMethod"');
  print('--------------------------');
  var methods = reflectType(ClassWithMethod).methods;
  print(methods.keys); // prints: 'someFunction'
  print(methods['someMethod'].returnType); // prints: String
  print(methods['someMethod'].annotations); // prints: [Instance of '_MyOtherAnnotation']
  print(methods['someMethod'].parameters); // prints: {p1: Instance of 'DeclarationMirror'}
  print(methods['someMethod'].parameters['someParameter'].annotations); // prints: [Instance of '_MyOtherAnnotation']
  print(methods['someMethod'].parameters['someParameter'].type); // prints: int

  print('\n--------------------------');
  print('reflecting "someFunction"');
  print('--------------------------');
  var sfMirror = reflectFunction(someFunction);
  print(sfMirror.name); // prints: '(someMethod)'
  print(sfMirror.returnType); // prints: dynamic
  print(sfMirror.annotations); // prints: [Instance of '_MyOtherAnnotation']
  print(sfMirror.parameters); // prints: {someParameter: Instance of 'DeclarationMirror'}
  print(sfMirror.parameters['p1'].annotations); // prints: [Instance of '_MyOtherAnnotation']
  print(sfMirror.parameters['p1'].type); // prints: String
  print(sfMirror.parameters.values.elementAt(0).name);
  print(sfMirror.parameters.values.elementAt(1).name);
  print(sfMirror.parameters.values.elementAt(2).name);
}
