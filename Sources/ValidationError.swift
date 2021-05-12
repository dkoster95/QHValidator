//
//  ValidationError.swift
//  QHValidator
//
//  Created by Daniel Koster on 5/12/21.
//

import Foundation

public enum ValidationError: Error {
    case with(message: String)
    case invalidRegularExpression
    case regularExpressionNotMatched
    case invalidString(lengthViolation: StringLengthViolation)
    case invalidInt(boundsViolation: NumberBoundsViolation)
    case invalidDouble(boundsViolation: NumberBoundsViolation)
    case invalidFloat(boundsViolation: NumberBoundsViolation)
    
    public enum StringLengthViolation {
        case minLength
        case maxLength
        case empty
    }
    
    public enum NumberBoundsViolation {
        case greater
        case lesser
    }
}
