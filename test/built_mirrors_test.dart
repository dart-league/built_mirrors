// Copyright (c) 2017, Luis Vargas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:built_mirrors/mirrors_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

void main() {
  test('generated files', () async {
    expect(await generate(await new File('example/bin/models.dart').readAsString()),
        await new File('example/bin/models.g.dart').readAsString());
  });
}

final String pkgName = 'pkg';

final Builder builder = new PartBuilder([new MirrorsGenerator()]);

Future<String> generate(String source) async {
  final srcs = <String, String>{
    'built_mirrors|lib/built_mirrors.dart': await new File('lib/built_mirrors.dart').readAsString(),
    '$pkgName|lib/value.dart': source,
  };

  final writer = new InMemoryAssetWriter();
  await testBuilder(builder, srcs, rootPackage: pkgName, writer: writer);
  return UTF8.decode(writer.assets[new AssetId(pkgName, 'lib/value.g.dart')]);
}
