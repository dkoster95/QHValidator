//
//  Validator+Float.swift
//  QHValidator
//
//  Created by Daniel Koster on 5/12/21.
//

import Foundation

public extension Validator where Input == Float {
    func inRange(min: Float, max: Float) -> Validator<Float> {
        return greaterOrEqualsThan(value: min).lesserOrEqualsThan(value: max)
    }
    
    func greaterThan(value: Float) -> Validator<Float> {
        return add { float in
            guard float > value else {
                throw ValidationError.invalidFloat(boundsViolation: .lesser)
            }
            return float > value
        }
    }
    
    func greaterOrEqualsThan(value: Float) -> Validator<Float> {
        return add { float in
            guard float >= value else {
                throw ValidationError.invalidFloat(boundsViolation: .lesser)
            }
            return float >= value
        }
    }
    
    func lesserThan(value: Float) -> Validator<Float> {
        return add { float in
            guard float < value else {
                throw ValidationError.invalidFloat(boundsViolation: .greater)
            }
            return float < value
        }
    }
    
    func lesserOrEqualsThan(value: Float) -> Validator<Float> {
        return add { float in
            guard float <= value else {
                throw ValidationError.invalidFloat(boundsViolation: .greater)
            }
            return float <= value
        }
    }
}
