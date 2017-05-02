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
