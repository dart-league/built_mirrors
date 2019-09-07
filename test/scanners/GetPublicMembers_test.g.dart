// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetVarialbesAndGettersTest_test;

// **************************************************************************
// MirrorsGenerator
// **************************************************************************

_ObjectWithMembers__Constructor([positionalParams, namedParams]) =>
    ObjectWithMembers();

const $$ObjectWithMembers_fields_name =
    DeclarationMirror(name: 'name', type: String);
const $$ObjectWithMembers_fields_age =
    DeclarationMirror(name: 'age', type: int);

const ObjectWithMembersClassMirror = ClassMirror(
    name: 'ObjectWithMembers',
    constructors: {
      '': FunctionMirror(name: '', $call: _ObjectWithMembers__Constructor)
    },
    fields: {
      'name': $$ObjectWithMembers_fields_name,
      'age': $$ObjectWithMembers_fields_age
    },
    getters: [
      'name',
      'age'
    ],
    setters: [
      'name',
      'age'
    ]);

_ExtendedObject__Constructor([positionalParams, namedParams]) =>
    ExtendedObject();

const $$ExtendedObject_fields_myProp =
    DeclarationMirror(name: 'myProp', type: String);

const ExtendedObjectClassMirror = ClassMirror(
    name: 'ExtendedObject',
    constructors: {
      '': FunctionMirror(name: '', $call: _ExtendedObject__Constructor)
    },
    fields: {
      'myProp': $$ExtendedObject_fields_myProp,
      'name': $$ObjectWithMembers_fields_name,
      'age': $$ObjectWithMembers_fields_age
    },
    getters: ['myProp', 'name', 'age'],
    setters: ['myProp', 'name', 'age'],
    superclass: ObjectWithMembers);

// **************************************************************************
// InitMirrorsGenerator
// **************************************************************************

_initMirrors() {
  initClassMirrors({
    ObjectWithMembers: ObjectWithMembersClassMirror,
    ExtendedObject: ExtendedObjectClassMirror
  });
}
