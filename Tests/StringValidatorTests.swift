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
        XCTAssertThrowsError(try subject
            .maxLength(length: 3)
            .validate(value: "hello"))
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
        XCTAssertThrowsError(try subject
            .minLength(length: 3)
            .validate(value: "he"))
    }
    
    func testNotEmptyIncorrect() {
        XCTAssertThrowsError(try subject
            .notEmpty()
            .validate(value: ""))
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
