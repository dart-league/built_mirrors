# Changelog

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
