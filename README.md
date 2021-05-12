# QHValidator
Input validator for Swift

## Validating an Integer
```swift
let numberValidator = Validator<Int>().lesserThan(value: 150).greaterOrEqualsThan(value: 10)
let result = try numberValidator.validate(value: 50)
```
## Validating a String
```swift
let emailValidator = Validator<String>().notEmpty().maxLength(length: 55).isEmailAddress()
let result = try emailValidator.validate(value: "yourmail@mail.com")
```
## Validating using the combine extension
```swift
let emailValidator = Validator<String>().notEmpty().maxLength(length: 55).isEmailAddress()
let result = emailValidator.validateAsPublisher(value: "yourmail@mail.com")
```
## Create your custom validation rule
Validator has an add method where you set a validation rule
```swift
func add(rule: @escaping (Input) throws -> Bool) -> Validator<Input>
```

See how it works:
```swift
let emailValidator = Validator<String>().notEmpty().maxLength(length: 55).isEmailAddress().add { string in 
  return string.count == 25
}
let result = try emailValidator.validate(value: "yourmail@mail.com")
```
## Requirements

- iOS 13.0+ 
- MacOS 10.15+
- Xcode 12.0.1+
- Swift 5+

---

## Installation

## Swift Package Manager
QHValidator has support for SPM, you just need to go to Xcode in the menu File/Swift Packages/Add package dependency
and you select the version of QHValidator.
