import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'init_mirrors_generator.dart';
import 'mirrors_generator.dart';

Builder builder(BuilderOptions _) => SharedPartBuilder([const MirrorsGenerator(), const InitMirrorsGenerator()], 'built_mirrors');
