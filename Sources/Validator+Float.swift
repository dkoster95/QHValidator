//
//  Validator+Float.swift
//  QHValidator
//
//  Created by Daniel Koster on 5/12/21.
//

import Foundation

public extension Validator where Input == Float {
    func inRange(min: Float, max: Float) -> Validator<Float> {
        return add { float in
            return float >= min && float <= max
        }
    }
    
    func greaterThan(value: Float) -> Validator<Float> {
        return add { float in
            return float > value
        }
    }
    
    func greaterOrEqualsThan(value: Float) -> Validator<Float> {
        return add { float in
            return float >= value
        }
    }
    
    func lesserThan(value: Float) -> Validator<Float> {
        return add { float in
            return float < value
        }
    }
    
    func lesserOrEqualsThan(value: Float) -> Validator<Float> {
        return add { float in
            return float <= value
        }
    }
}
