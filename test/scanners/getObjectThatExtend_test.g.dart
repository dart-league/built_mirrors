// GENERATED CODE - DO NOT MODIFY BY HAND

part of getObjectThatExtend_test;

// **************************************************************************
// Generator: MirrorsGenerator
// **************************************************************************

const Service1ClassMirror =
    const ClassMirror(name: 'Service1', isAbstract: true);
_Service1Impl__Constructor([positionalParams, namedParams]) =>
    new Service1Impl();

const Service1ImplClassMirror = const ClassMirror(
    name: 'Service1Impl',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _Service1Impl__Constructor)
    },
    superinterfaces: const [
      Service1
    ]);

const Service2ClassMirror =
    const ClassMirror(name: 'Service2', isAbstract: true);
_Service2Impl__Constructor([positionalParams, namedParams]) =>
    new Service2Impl();

const Service2ImplClassMirror = const ClassMirror(
    name: 'Service2Impl',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _Service2Impl__Constructor)
    },
    superinterfaces: const [
      Service2
    ]);
_Service22Impl__Constructor([positionalParams, namedParams]) =>
    new Service22Impl();

const Service22ImplClassMirror = const ClassMirror(
    name: 'Service22Impl',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _Service22Impl__Constructor)
    },
    superclass: Service2Impl);

// **************************************************************************
// Generator: InitMirrorsGenerator
// **************************************************************************

_initMirrors() {
  initClassMirrors({
    Service1: Service1ClassMirror,
    Service1Impl: Service1ImplClassMirror,
    Service2: Service2ClassMirror,
    Service2Impl: Service2ImplClassMirror,
    Service22Impl: Service22ImplClassMirror
  });
}
