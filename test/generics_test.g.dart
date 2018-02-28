// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_mirrors.example.generics_test;

// **************************************************************************
// Generator: MirrorsGenerator
// **************************************************************************

_NoGeneric__Constructor([positionalParams, namedParams]) => new NoGeneric();

const NoGenericClassMirror = const ClassMirror(
    name: 'NoGeneric',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _NoGeneric__Constructor)
    });
_Generic1__Constructor([positionalParams, namedParams]) => new Generic1();

const $$Generic1_fields_mList =
    const DeclarationMirror(name: 'mList', type: const [List, dynamic]);

const Generic1ClassMirror = const ClassMirror(
    name: 'Generic1',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _Generic1__Constructor)
    },
    fields: const {
      'mList': $$Generic1_fields_mList
    },
    getters: const [
      'mList'
    ],
    setters: const [
      'mList'
    ]);
_Generic2__Constructor([positionalParams, namedParams]) => new Generic2();

const $$Generic2_fields_mMap =
    const DeclarationMirror(name: 'mMap', type: const [
  Map,
  const [dynamic, dynamic]
]);

const Generic2ClassMirror = const ClassMirror(
    name: 'Generic2',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _Generic2__Constructor)
    },
    fields: const {
      'mMap': $$Generic2_fields_mMap
    },
    getters: const [
      'mMap'
    ],
    setters: const [
      'mMap'
    ]);

// **************************************************************************
// Generator: InitMirrorsGenerator
// **************************************************************************

_initMirrors() {
  initClassMirrors({
    NoGeneric: NoGenericClassMirror,
    Generic1: Generic1ClassMirror,
    Generic2: Generic2ClassMirror
  });

  getClassMirrorFromGenericInstance = (instance) => instance is Generic1
      ? Generic1ClassMirror
      : instance is Generic2 ? Generic2ClassMirror : null;
}
