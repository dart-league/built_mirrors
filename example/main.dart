// Copyright (c) 2017, Luis Vargas. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.

import 'models.dart';
import 'package:built_mirrors/built_mirrors.dart';

main() {

  // Initializes the `Type-ClassMirror` map
  initClassMirrors({
    Person: PersonClassMirror,
    Car: CarClassMirror
  });

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

  // prints: `getSymbolName(#mySymbol): mySymbol`
  print('getSymbolName(#mySymbol): ${getSymbolName(#mySymbol)}');

}
