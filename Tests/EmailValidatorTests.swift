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
        let result = try! subject.isEmailAddress().validate(value: "daniel@gmailcom")
        XCTAssertFalse(result)
    }
    
    func testEmailInvalidWithoutAt() {
        let result = try! subject.isEmailAddress().validate(value: "daniel.gmail.com")
        XCTAssertFalse(result)
    }
    
    func testPasswordValid() {
        let result = try! subject.isPassword().validate(value: "Daniel123")
        XCTAssertTrue(result)
    }
    
    func testPasswordInvalidNoUpper() {
        let result = try! subject.isPassword().validate(value: "daniel123")
        XCTAssertFalse(result)
    }
    
    func testPasswordInvalidNoLower() {
        let result = try! subject.isPassword().validate(value: "DANIEL123")
        XCTAssertFalse(result)
    }
    
    func testPasswordInvalidNoNumber() {
        let result = try! subject.isPassword().validate(value: "danielitoqwe")
        XCTAssertFalse(result)
    }
    
    func testPasswordInvalidLessThan8Characters() {
        let result = try! subject.isPassword().validate(value: "Da12ass")
        XCTAssertFalse(result)
    }
}
