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
}
