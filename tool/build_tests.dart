import 'package:build_runner/build_runner.dart';
import 'package:built_mirrors/phase.dart';


main() async {
  await build([builtMirrorsAction(const ['test/**.dart'])], deleteFilesByDefault: true);
}