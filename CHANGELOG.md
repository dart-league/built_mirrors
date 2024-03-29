# 2.0.1

- Make generator skip `SerializableMap` and `Map` supertypes
- Fix generation of generic superclass and superinterfaces in `ClassMirror` constructors

# 2.0.0

- Upgrade sdk to `>=3.0.0 <4.0.0`
- Upgrade `source_gen` to `^1.3.2`
- Upgrade `build` to `^2.4.0`
- Upgrade `analyzer` to `^5.13.0`
- Add `collection` `^1.17.2`
- Upgrade `test` to `^1.24.3`
- Upgrade `build_test` to `^2.1.7`
- Upgrade `build_runner` to `^2.4.4`

# 1.0.0

- Upgrade `source_gen` to `^1.2.1`
- Upgrade `build` to `^3.3.1`
- Upgrade `analyzer` to `^0.40.0`
- Upgrade `test` to `^1.20.2`
- Upgrade `build_test` to `^2.1.5`
- Upgrade `build_runner` to `^2.1.8`

# 0.13.0

- Upgrade `analyzer` to `^0.40.0`

# 0.12.0

- Upgrade `build_test` to `^1.2.0`

# 0.11.0

- Add `analysis_options` and check for unnecessary `new` and `const` kewords
- Remove dependency on `built_mirrors_core`
- Change builder from `PartBuilder` to `SharedPartBuilder`, this way generator can run alongside with other generators
- Make builder `auto_apply: dependents`. This way builder only run on direct dependents

# 0.10.6

- set `analyzer` to version `>=0.36.0 <1.0.0`

# 0.10.5

- upgrade `analyzer` to version `^0.36.0`

# 0.10.2

- upgrade `analyzer` to version `^0.34.0`

# 0.10.1

- upgrade `analyzer` to version `^0.33.0`
- upgrade `build_runner` to version `^1.0.0`
- upgrade `build` to version `^1.0.1`

# 0.10.0

- add `SerializedName` annotation, this annotation will be compiled time only.

# 0.9.0

- upgrade `source_gen` to version `^0.9.0`
- upgrade `build_runner` to version `^0.9.0`


# 0.8.5

- upgrade `analyzer` to version `^0.32.0`
- upgrade `build_runner` to version `0.8.10`
- upgrade `test` to version `^1.0.0`

# 0.8.4

- upgrade `source_gen` to version `0.8.0`

# 0.8.3

- add generics support

# 0.8.2

- add `built_mirrors_core` package

# 0.8.1

- Add `build_runner` package as `dev_dependency`

# 0.8.0

- upgrade `build` package to `^0.12.0`
- remove `build_runner` package
- remove files in `tool` folder

# 0.7.1

- add name param to fields and constructors

# 0.7.0

- fixed the null issue
- upgrade `build` package to `^0.11.1`
- upgrade `build_runner` to version `^0.6.0`

# 0.6.0

- split function parameters into positional and named
- rename `phase.dart` to `action.dart`

# 0.5.2

- add generators for annotations with List, Map and other constants

# 0.5.1

- add `name` to `DeclarationMirror` generator

# 0.5.0

- upgrade `build_runner` to version `^0.4.0`
- upgrade `build` to version `^0.10.0`

# 0.4.0

- upgrade `build_runner` to version `^0.4.0`
- upgrade `build` to version `^0.10.0`

# 0.3.0

- upgrade `source_gen` pacakge to version `^0.6.0`
- change `a.constanValue` to `a.computeConstantValue()`

# 0.2.4

- allow multiple initMirrors functions

# 0.2.3

- correct default values for dartdoc

## 0.2.2

- upgrade `build` package to version `^0.9.0`

## 0.2.1

- make generated strings raw

## 0.2.0

- remove `packageName` parameter from `phase`
- upgrade `build_test` to version `^0.5.0`

## 0.1.3

- correct `_getExtensionLevel` when processing non-reflectable classes
- correct `mirror_generator` for generating function values in annotations parameters

## 0.1.2

- enable `strong-mode` in `.analysys_options`
- correct getter `functionMirrors`

## 0.1.1

- add `scanners`

## 0.1.0

- add `FunctionMirrors`
- add `MethodMirrors` generation to `ClassMirror`
- 

## 0.0.8

- make `ClassMirror.name` public again

## 0.0.7

- add enum to `InitClassMirrorsGenerator`

## 0.0.6

- reinitialize static variables from `InitClassMirrorsGenerator` to avoid multiple adding mirrors from other modules

## 0.0.5

- add `init_class_mirrors_generator`
- rename `generator.dart` to `class_mirrors_generator`
_ rename `BuiltMirrorsGenerator` to `ClassMirrorsGenerator`

## 0.0.4

- `ClassMirror`:
    - add `name` and `toString` to have better logging.
    - add `isEnum` and `values` to support `enum` types
- Add `FunctionCall` Typedef to enhance the type of `FunctionMirror.call`
- `DeclarationMirror`:
    - add `isFinal` to handel if a field is final
    - add `isOptional` to handle if a parameter is optional
- `BuiltMirrorsGenerator`:
    - add `enum-ClassMirror` template
    - add `isOptional` template for optional parameters
    - add `isFinal` template for final fields

8fc2109 Luis Vargas <luisvargastijerino@gmail.com> on 1/28/17 at 1:05 PM

## 0.0.3

- support annotations in classes
- support shorthand annotations

## 0.0.2

- Remove `getSymbolName` function

## 0.0.1

- Initial version
