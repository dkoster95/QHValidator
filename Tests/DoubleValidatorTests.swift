//
//  DoubleValidatorTests.swift
//  QHValidatorTests
//
//  Created by Daniel Koster on 5/12/21.
//

import XCTest
import QHValidator

class DoubleValidatorTests: XCTestCase {

    let subject = Validator<Double>()
    func testBetween() {
        let result = try! subject.inRange(min: 0, max: 100).validate(value: 23)
        XCTAssertTrue(result)
    }
    
    func testBetweenFalse() {
        XCTAssertThrowsError(try subject.inRange(min: 0, max: 100).validate(value: 123))
    }
    
    func testGreaterTrue() {
        let result = try! subject.greaterThan(value: 100).validate(value: 123)
        XCTAssertTrue(result)
    }
    
    func testGreaterFalse() {
        XCTAssertThrowsError(try subject.greaterThan(value: 150).validate(value: 123))
    }
    
    func testGreaterEqualsTrue() {
        let result = try! subject.greaterOrEqualsThan(value: 123).validate(value: 123)
        XCTAssertTrue(result)
    }
    
    func testGreaterEqualsFalse() {
        XCTAssertThrowsError(try subject.greaterOrEqualsThan(value: 150).validate(value: 123))
    }
    
    func testLesserTrue() {
        let result = try! subject.lesserThan(value: 150).validate(value: 123)
        XCTAssertTrue(result)
    }
    
    func testLesserFalse() {
        XCTAssertThrowsError(try subject.lesserThan(value: 100).validate(value: 123))
    }
    
    func testLesserEqualsTrue() {
        let result = try! subject.lesserOrEqualsThan(value: 123).validate(value: 123)
        XCTAssertTrue(result)
    }
    
    func testLesserEqualsFalse() {
        XCTAssertThrowsError(try subject.lesserOrEqualsThan(value: 100).validate(value: 123))
    }

}
