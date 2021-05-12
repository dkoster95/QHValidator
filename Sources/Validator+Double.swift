//
//  Validator+Double.swift
//  QHValidator
//
//  Created by Daniel Koster on 5/12/21.
//

import Foundation

public extension Validator where Input == Double {
    func inRange(min: Double, max: Double) -> Validator<Double> {
        return greaterOrEqualsThan(value: min)
                .lesserOrEqualsThan(value: max)
    }
    
    func greaterThan(value: Double) -> Validator<Double> {
        return add { double in
            guard double > value else {
                throw ValidationError.invalidDouble(boundsViolation: .lesser)
            }
            return double > value
        }
    }
    
    func greaterOrEqualsThan(value: Double) -> Validator<Double> {
        return add { double in
            guard double >= value else {
                throw ValidationError.invalidDouble(boundsViolation: .lesser)
            }
            return double >= value
        }
    }
    
    func lesserThan(value: Double) -> Validator<Double> {
        return add { double in
            guard double < value else {
                throw ValidationError.invalidDouble(boundsViolation: .greater)
            }
            return double < value
        }
    }
    
    func lesserOrEqualsThan(value: Double) -> Validator<Double> {
        return add { double in
            guard double <= value else {
                throw ValidationError.invalidDouble(boundsViolation: .greater)
            }
            return double <= value
        }
    }
}
