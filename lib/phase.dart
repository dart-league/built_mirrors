import 'package:build_runner/build_runner.dart';
import 'package:built_mirrors/generator.dart';
import 'package:source_gen/source_gen.dart';

/// Creates a `built_mirrors` generator-builder phase.
///
/// Example: {@example /tool/build.dart}
/// Example: {@example /tool/watch.dart}
builtMirrorsPhase(String packageName, Iterable<String> globs) =>
    new Phase()..addAction(
        new GeneratorBuilder(const [const BuiltMirrorsGenerator()]),
        new InputSet(packageName, globs));