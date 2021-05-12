//
//  Validator+Int.swift
//  QHValidator
//
//  Created by Daniel Koster on 5/12/21.
//

import Foundation

public extension Validator where Input == Int {
    func inRange(min: Int, max: Int) -> Validator<Int> {
        return greaterOrEqualsThan(value: min).lesserOrEqualsThan(value: (max))
        
    }
    
    func greaterThan(value: Int) -> Validator<Int> {
        return add { integer in
            guard integer > value else {
                throw ValidationError.invalidInt(boundsViolation: .lesser)
            }
            return integer > value
        }
    }
    
    func greaterOrEqualsThan(value: Int) -> Validator<Int> {
        return add { integer in
            guard integer >= value else {
                throw ValidationError.invalidInt(boundsViolation: .lesser)
            }
            return integer >= value
        }
    }
    
    func lesserThan(value: Int) -> Validator<Int> {
        return add { integer in
            guard integer < value else {
                throw ValidationError.invalidInt(boundsViolation: .greater)
            }
            return integer < value
        }
    }
    
    func lesserOrEqualsThan(value: Int) -> Validator<Int> {
        return add { integer in
            guard integer <= value else {
                throw ValidationError.invalidInt(boundsViolation: .greater)
            }
            return integer <= value
        }
    }
}
