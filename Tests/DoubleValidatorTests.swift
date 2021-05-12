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
        let result = try! subject.inRange(min: 0, max: 100).validate(value: 123)
        XCTAssertFalse(result)
    }
    
    func testGreaterTrue() {
        let result = try! subject.greaterThan(value: 100).validate(value: 123)
        XCTAssertTrue(result)
    }
    
    func testGreaterFalse() {
        let result = try! subject.greaterThan(value: 150).validate(value: 123)
        XCTAssertFalse(result)
    }
    
    func testGreaterEqualsTrue() {
        let result = try! subject.greaterOrEqualsThan(value: 123).validate(value: 123)
        XCTAssertTrue(result)
    }
    
    func testGreaterEqualsFalse() {
        let result = try! subject.greaterOrEqualsThan(value: 150).validate(value: 123)
        XCTAssertFalse(result)
    }
    
    func testLesserTrue() {
        let result = try! subject.lesserThan(value: 150).validate(value: 123)
        XCTAssertTrue(result)
    }
    
    func testLesserFalse() {
        let result = try! subject.lesserThan(value: 100).validate(value: 123)
        XCTAssertFalse(result)
    }
    
    func testLesserEqualsTrue() {
        let result = try! subject.lesserOrEqualsThan(value: 123).validate(value: 123)
        XCTAssertTrue(result)
    }
    
    func testLesserEqualsFalse() {
        let result = try! subject.lesserOrEqualsThan(value: 100).validate(value: 123)
        XCTAssertFalse(result)
    }


}
