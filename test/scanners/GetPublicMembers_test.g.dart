// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetVarialbesAndGettersTest_test;

// **************************************************************************
// Generator: InitMirrorsGenerator
// Target: library GetVarialbesAndGettersTest_test
// **************************************************************************

_initMirrors() {
  initClassMirrors({
    ObjectWithMembers: ObjectWithMembersClassMirror,
    ExtendedObject: ExtendedObjectClassMirror
  });
  initFunctionMirrors({});
}

// **************************************************************************
// Generator: MirrorsGenerator
// Target: class ObjectWithMembers
// **************************************************************************

_ObjectWithMembers__Constructor(params) => new ObjectWithMembers();

const $$ObjectWithMembers_fields_name = const DeclarationMirror(type: String);
const $$ObjectWithMembers_fields_age = const DeclarationMirror(type: int);

const ObjectWithMembersClassMirror =
    const ClassMirror(name: 'ObjectWithMembers', constructors: const {
  '': const FunctionMirror(
      parameters: const {}, call: _ObjectWithMembers__Constructor)
}, fields: const {
  'name': $$ObjectWithMembers_fields_name,
  'age': $$ObjectWithMembers_fields_age
}, getters: const [
  'name',
  'age'
], setters: const [
  'name',
  'age'
]);

// **************************************************************************
// Generator: MirrorsGenerator
// Target: class ExtendedObject
// **************************************************************************

_ExtendedObject__Constructor(params) => new ExtendedObject();

const $$ExtendedObject_fields_myProp = const DeclarationMirror(type: String);

const ExtendedObjectClassMirror = const ClassMirror(
    name: 'ExtendedObject',
    constructors: const {
      '': const FunctionMirror(
          parameters: const {}, call: _ExtendedObject__Constructor)
    },
    fields: const {
      'myProp': $$ExtendedObject_fields_myProp,
      'name': $$ObjectWithMembers_fields_name,
      'age': $$ObjectWithMembers_fields_age
    },
    getters: const ['myProp', 'name', 'age'],
    setters: const ['myProp', 'name', 'age'],
    superclass: ObjectWithMembers);
