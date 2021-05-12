//
//  Validator+Int.swift
//  QHValidator
//
//  Created by Daniel Koster on 5/12/21.
//

import Foundation

public extension Validator where Input == Int {
    func inRange(min: Int, max: Int) -> Validator<Int> {
        return add { integer in
            return integer >= min && integer <= max
        }
    }
    
    func greaterThan(value: Int) -> Validator<Int> {
        return add { integer in
            return integer > value
        }
    }
    
    func greaterOrEqualsThan(value: Int) -> Validator<Int> {
        return add { integer in
            return integer >= value
        }
    }
    
    func lesserThan(value: Int) -> Validator<Int> {
        return add { integer in
            return integer < value
        }
    }
    
    func lesserOrEqualsThan(value: Int) -> Validator<Int> {
        return add { integer in
            return integer <= value
        }
    }
}
