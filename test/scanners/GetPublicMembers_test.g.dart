// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetVarialbesAndGettersTest_test;

// **************************************************************************
// Generator: MirrorsGenerator
// **************************************************************************

_ObjectWithMembers__Constructor([positionalParams, namedParams]) =>
    new ObjectWithMembers();

const $$ObjectWithMembers_fields_name =
    const DeclarationMirror(name: 'name', type: String);
const $$ObjectWithMembers_fields_age =
    const DeclarationMirror(name: 'age', type: int);

const ObjectWithMembersClassMirror = const ClassMirror(
    name: 'ObjectWithMembers',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _ObjectWithMembers__Constructor)
    },
    fields: const {
      'name': $$ObjectWithMembers_fields_name,
      'age': $$ObjectWithMembers_fields_age
    },
    getters: const [
      'name',
      'age'
    ],
    setters: const [
      'name',
      'age'
    ]);
_ExtendedObject__Constructor([positionalParams, namedParams]) =>
    new ExtendedObject();

const $$ExtendedObject_fields_myProp =
    const DeclarationMirror(name: 'myProp', type: String);

const ExtendedObjectClassMirror = const ClassMirror(
    name: 'ExtendedObject',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _ExtendedObject__Constructor)
    },
    fields: const {
      'myProp': $$ExtendedObject_fields_myProp,
      'name': $$ObjectWithMembers_fields_name,
      'age': $$ObjectWithMembers_fields_age
    },
    getters: const ['myProp', 'name', 'age'],
    setters: const ['myProp', 'name', 'age'],
    superclass: ObjectWithMembers);

// **************************************************************************
// Generator: InitMirrorsGenerator
// **************************************************************************

_initMirrors() {
  initClassMirrors({
    ObjectWithMembers: ObjectWithMembersClassMirror,
    ExtendedObject: ExtendedObjectClassMirror
  });
  initFunctionMirrors({});
}
