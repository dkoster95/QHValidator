//
//  Validator.swift
//  QHValidator
//
//  Created by Daniel Koster on 5/12/21.
//

import Foundation
import Combine

public class Validator<Input> {
    private let tail: Validator<Input>?
    private let validationRule: ((Input) throws -> Bool)?
    
    public init(validationRule: ((Input) throws -> Bool)? = nil, tail: Validator<Input>? = nil) {
        self.validationRule = validationRule
        self.tail = tail
    }
    
    public func add(rule: @escaping (Input) throws -> Bool) -> Validator<Input> {
        guard let tail = self.tail else {
            let newValidator = Validator<Input>(validationRule: rule)
            return Validator<Input>(validationRule: validationRule, tail: newValidator)
        }
        return Validator<Input>(validationRule: self.validationRule,
                            tail: tail.add(rule: rule))
    }
    
    public func validate(value: Input) throws -> Bool {
        guard let tail = self.tail else {
            return try validationRule?(value) ?? true
        }
        return try validationRule?(value) ?? true && tail.validate(value: value)
    }
}
