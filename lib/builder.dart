import 'package:build/build.dart';
import 'package:built_mirrors/init_mirrors_generator.dart';
import 'package:built_mirrors/mirrors_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder builder(_) => new PartBuilder([const MirrorsGenerator(), const InitMirrorsGenerator()]);