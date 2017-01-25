import 'package:build_runner/build_runner.dart';
import 'package:built_mirrors/phase.dart';


main() async {
  await build(new PhaseGroup()
    ..addPhase(
    // In next line replace `built_mirrors` for the name of your package
    // and `example/*.dart` for the globs you want to use as input, for example `**/*.dart`
    // to take all the dart files of the project as input.
        builtMirrorsPhase('built_mirrors', const ['example/*.dart'])),
      deleteFilesByDefault: true);
}