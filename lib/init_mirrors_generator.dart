import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class InitMirrorsGenerator extends Generator {

  const InitMirrorsGenerator();

  static Set<LibraryElement> libraryElements;

  static Set<String> _classMirrors;

  static Set<String> _functionMirrors;

  static List<_MirrorFromInstance> _getClassMirrorFromInstances;

  @override
  Future<String> generate(LibraryReader libraryReader, BuildStep buildStep) async {
    libraryElements = Set();
    _classMirrors = Set();
    _functionMirrors = Set();
    _getClassMirrorFromInstances = [];
    var element = libraryReader.element;
    if (element.entryPoint != null && element.name != '') {
      _mapLibraries(element);
      libraryElements.forEach((il) {
        _addMirrorsFromLibrary(il);
      });

      return '''_initMirrors() {
  initClassMirrors({
  ${_classMirrors.join(',\n')}
  });
  ${_functionMirrors.isNotEmpty
      ? """initFunctionMirrors({
        ${_functionMirrors.join(',\n')}
        });"""
      : ''}
  
  ${_getClassMirrorFromInstances.isNotEmpty
          ? 'getClassMirrorFromGenericInstance = (instance) => ${
          (_getClassMirrorFromInstances..sort((m1, m2) => m2.extensionLevel.compareTo(m1.extensionLevel)))
              .map((mfi) => 'instance is ${mfi.className} ? ${mfi.className}ClassMirror :').join('\n')} null;'
          : ''}
}''';
    }

    return null;
  }

  void _mapLibraries(LibraryElement le) {
    if (le.name != '' && !libraryElements.contains(le)) {
      libraryElements.add(le);
      le.importedLibraries.forEach(_mapLibraries);
      le.exportedLibraries.forEach(_mapLibraries);
    }
  }

  void _addMirrorsFromLibrary(LibraryElement library) {
    library.units.forEach((unit) {
      unit.enums.forEach((enum_) {
        if (enum_.metadata.any(_isReflectable))
          _classMirrors.add('${enum_.name}: ${enum_.name}ClassMirror');
      });
      unit.types.forEach((type) {
        if (type.metadata.any(_isReflectable)) {
          _classMirrors.add('${type.name}: ${type.name}ClassMirror');
          if (type.typeParameters.isNotEmpty)
            _getClassMirrorFromInstances.add(_MirrorFromInstance(type.name, type.allSupertypes.length));
        }
      });
      unit.functions.forEach((function) {
        if (function.metadata.any(_isReflectable))
          _functionMirrors.add('${function.name}: ${function.name}FunctionMirror');
      });
    });
  }

  bool _isReflectable(ElementAnnotation a) {
    var acv = a.computeConstantValue();
    return acv != null && (acv.type.name == 'Reflectable'
        || (acv.type.element as ClassElement).allSupertypes.any((st) => st.name == 'Reflectable'));
  }
}

class _MirrorFromInstance {
  String className;

  int extensionLevel;

  _MirrorFromInstance(this.className, this.extensionLevel);
}
