//
//  Validator+String.swift
//  QHValidator
//
//  Created by Daniel Koster on 5/12/21.
//

import Foundation

public extension Validator where Input == String {
    
    func minLength(length: Int) -> Validator<String> {
        return add { string in
            guard string.count >= length else {
                throw ValidationError.invalidString(lengthViolation: .minLength)
            }
            return string.count >= length
        }
    }
    
    func match(pattern: NSPredicate) -> Validator<String> {
        return add { string in
            let regexResult = pattern.evaluate(with: string)
            guard regexResult else {
                throw ValidationError.regularExpressionNotMatched
            }
            return pattern.evaluate(with: string)
        }
    }
    
    func match(regex: String, options: NSRegularExpression.Options) -> Validator<String> {
        return add { string in
            if let regex = try? NSRegularExpression(pattern: regex, options: options) {
                return !regex.matches(in: string, options: [], range: NSRange(string.startIndex..., in: string)).isEmpty
            }
            throw ValidationError.invalidRegularExpression
        }
    }
    
    func maxLength(length: Int) -> Validator<String> {
        return add { string in
            guard string.count <= length else {
                throw ValidationError.invalidString(lengthViolation: .maxLength)
            }
            return string.count <= length
        }
    }
    
    func notEmpty() -> Validator<String> {
        return add { string in
            guard !string.isEmpty else {
                throw ValidationError.invalidString(lengthViolation: .empty)
            }
            return !string.isEmpty
        }
    }
}
