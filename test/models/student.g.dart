// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_mirrors.test.models.student;

// **************************************************************************
// Generator: MirrorsGenerator
// **************************************************************************

_Student__Constructor([positionalParams, namedParams]) => new Student();

const $$Student_fields_studentId =
    const DeclarationMirror(name: 'studentId', type: String);
const $$Student_fields_courses =
    const DeclarationMirror(name: 'courses', type: const [List, Course]);

const StudentClassMirror = const ClassMirror(
    name: 'Student',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _Student__Constructor)
    },
    fields: const {
      'studentId': $$Student_fields_studentId,
      'courses': $$Student_fields_courses,
      'id': $$Person_fields_id,
      'firstName': $$Person_fields_firstName,
      'className': $$Person_fields_className,
      'dateOfBirth': $$Person_fields_dateOfBirth
    },
    getters: const [
      'studentId',
      'courses',
      'id',
      'firstName',
      'className',
      'dateOfBirth'
    ],
    setters: const [
      'studentId',
      'courses',
      'id',
      'firstName',
      'className',
      'dateOfBirth'
    ],
    superclass: Person);
