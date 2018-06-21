// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_mirrors.test.models.employee;

// **************************************************************************
// MirrorsGenerator
// **************************************************************************

_Employee__Constructor([positionalParams, namedParams]) => new Employee();

const $$Employee_fields_salary =
    const DeclarationMirror(name: 'salary', type: num);

const EmployeeClassMirror = const ClassMirror(
    name: 'Employee',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _Employee__Constructor)
    },
    fields: const {
      'salary': $$Employee_fields_salary,
      'id': $$Person_fields_id,
      'firstName': $$Person_fields_firstName,
      'className': $$Person_fields_className,
      'dateOfBirth': $$Person_fields_dateOfBirth
    },
    getters: const ['salary', 'id', 'firstName', 'className', 'dateOfBirth'],
    setters: const ['salary', 'id', 'firstName', 'className', 'dateOfBirth'],
    superclass: Person);
