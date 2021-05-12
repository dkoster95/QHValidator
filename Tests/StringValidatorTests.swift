//
//  StringValidatorTests.swift
//  QHValidatorTests
//
//  Created by Daniel Koster on 5/12/21.
//

import XCTest
import QHValidator

class StringValidatorTests: XCTestCase {
    
    let subject = Validator<String>()
    
    func testMaxLengthIncorrect() {
        let result = try! subject
            .maxLength(length: 3)
            .validate(value: "hello")
        XCTAssertFalse(result)
    }
    
    func testMaxLengthCorrect() {
        let result = try! subject
            .maxLength(length: 3)
            .validate(value: "hel")
        XCTAssertTrue(result)
    }
    
    func testMinLengthCorrect() {
        let result = try! subject
            .minLength(length: 3)
            .validate(value: "hel")
        XCTAssertTrue(result)
    }
    
    func testMinLengthIncorrect() {
        let result = try! subject
            .minLength(length: 3)
            .validate(value: "he")
        XCTAssertFalse(result)
    }
    
    func testNotEmptyIncorrect() {
        let result = try! subject
            .notEmpty()
            .validate(value: "")
        XCTAssertFalse(result)
    }
    
    func testNotEmptyCorrect() {
        let result = try! subject
            .notEmpty()
            .validate(value: "asd")
        XCTAssertTrue(result)
    }
    
    func testNestedOperations() {
        let result = try! subject
            .notEmpty()
            .maxLength(length: 3)
            .validate(value: "asd")
        XCTAssertTrue(result)
    }
    
}
