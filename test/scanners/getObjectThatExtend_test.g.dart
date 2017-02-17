// GENERATED CODE - DO NOT MODIFY BY HAND

part of getObjectThatExtend_test;

// **************************************************************************
// Generator: InitMirrorsGenerator
// Target: library getObjectThatExtend_test
// **************************************************************************

_initMirrors() {
  initClassMirrors({
    Service1: Service1ClassMirror,
    Service1Impl: Service1ImplClassMirror,
    Service2: Service2ClassMirror,
    Service2Impl: Service2ImplClassMirror,
    Service22Impl: Service22ImplClassMirror
  });
  initFunctionMirrors({});
}

// **************************************************************************
// Generator: MirrorsGenerator
// Target: abstract class Service1
// **************************************************************************

const Service1ClassMirror =
    const ClassMirror(name: 'Service1', isAbstract: true);

// **************************************************************************
// Generator: MirrorsGenerator
// Target: class Service1Impl
// **************************************************************************

_Service1Impl__Constructor(params) => new Service1Impl();

const Service1ImplClassMirror = const ClassMirror(
    name: 'Service1Impl',
    constructors: const {
      '': const FunctionMirror(
          parameters: const {}, call: _Service1Impl__Constructor)
    },
    superinterfaces: const [
      Service1
    ]);

// **************************************************************************
// Generator: MirrorsGenerator
// Target: abstract class Service2
// **************************************************************************

const Service2ClassMirror =
    const ClassMirror(name: 'Service2', isAbstract: true);

// **************************************************************************
// Generator: MirrorsGenerator
// Target: class Service2Impl
// **************************************************************************

_Service2Impl__Constructor(params) => new Service2Impl();

const Service2ImplClassMirror = const ClassMirror(
    name: 'Service2Impl',
    constructors: const {
      '': const FunctionMirror(
          parameters: const {}, call: _Service2Impl__Constructor)
    },
    superinterfaces: const [
      Service2
    ]);

// **************************************************************************
// Generator: MirrorsGenerator
// Target: class Service22Impl
// **************************************************************************

_Service22Impl__Constructor(params) => new Service22Impl();

const Service22ImplClassMirror = const ClassMirror(
    name: 'Service22Impl',
    constructors: const {
      '': const FunctionMirror(
          parameters: const {}, call: _Service22Impl__Constructor)
    },
    superclass: Service2Impl);
