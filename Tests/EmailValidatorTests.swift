//
//  EmailValidatorTests.swift
//  QHValidatorTests
//
//  Created by Daniel Koster on 5/12/21.
//

import XCTest
import QHValidator

class EmailValidatorTests: XCTestCase {
    
    let subject = Validator<String>()
    
    func testEmailValid() {
        let result = try! subject.isEmailAddress().validate(value: "daniel@gmail.com")
        XCTAssertTrue(result)
    }
    
    func testEmailInvalid() {
        XCTAssertThrowsError(try subject.isEmailAddress().validate(value: "daniel@gmailcom"))
    }
    
    func testEmailInvalidWithoutAt() {
        XCTAssertThrowsError(try subject.isEmailAddress().validate(value: "daniel.gmail.com"))
    }
    
    func testPasswordValid() {
        let result = try! subject.isPassword().validate(value: "Daniel123")
        XCTAssertTrue(result)
    }
    
    func testPasswordInvalidNoUpper() {
        XCTAssertThrowsError(try subject.isPassword().validate(value: "daniel123"))
    }
    
    func testPasswordInvalidNoLower() {
        XCTAssertThrowsError(try subject.isPassword().validate(value: "DANIEL123"))
    }
    
    func testPasswordInvalidNoNumber() {
        XCTAssertThrowsError(try subject.isPassword().validate(value: "danielitoqwe"))
    }
    
    func testPasswordInvalidLessThan8Characters() {
        XCTAssertThrowsError(try subject.isPassword().validate(value: "Da12ass"))
    }
}
