// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generics_test.dart';

// **************************************************************************
// MirrorsGenerator
// **************************************************************************

_NoGeneric__Constructor([positionalParams, namedParams]) => NoGeneric();

const NoGenericClassMirror = ClassMirror(name: 'NoGeneric', constructors: {
  '': FunctionMirror(name: '', $call: _NoGeneric__Constructor)
});

_Generic1__Constructor([positionalParams, namedParams]) => Generic1();

const $$Generic1_fields_mList =
    DeclarationMirror(name: 'mList', type: [List, dynamic]);

const Generic1ClassMirror = ClassMirror(
    name: 'Generic1',
    constructors: {'': FunctionMirror(name: '', $call: _Generic1__Constructor)},
    fields: {'mList': $$Generic1_fields_mList},
    getters: ['mList'],
    setters: ['mList']);

_Generic2__Constructor([positionalParams, namedParams]) => Generic2();

const $$Generic2_fields_mMap = DeclarationMirror(name: 'mMap', type: [
  Map,
  [dynamic, dynamic]
]);

const Generic2ClassMirror = ClassMirror(
    name: 'Generic2',
    constructors: {'': FunctionMirror(name: '', $call: _Generic2__Constructor)},
    fields: {'mMap': $$Generic2_fields_mMap},
    getters: ['mMap'],
    setters: ['mMap']);

// **************************************************************************
// InitMirrorsGenerator
// **************************************************************************

_initMirrors() {
  initClassMirrors({
    NoGeneric: NoGenericClassMirror,
    Generic1: Generic1ClassMirror,
    Generic2: Generic2ClassMirror
  });

  getClassMirrorFromGenericInstance = (instance) => instance is Generic1
      ? Generic1ClassMirror
      : instance is Generic2
          ? Generic2ClassMirror
          : null;
}
