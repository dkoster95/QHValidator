//
//  CombineValidator.swift
//  QHValidator
//
//  Created by Daniel Koster on 5/12/21.
//

import XCTest
import QHValidator
import Combine

class CombineValidatorTests: XCTestCase {
    let subject = Validator<String>()
    var bag = Set<AnyCancellable>()
    
    func testCombineFlow() {
        let expectation = XCTestExpectation()
        let publisher = subject
            .maxLength(length: 21)
            .minLength(length: 3)
            .notEmpty()
            .validateAsPublisher(value: "12")
        publisher.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                expectation.fulfill()
                XCTAssertEqual(error, ValidationError.invalidString(lengthViolation: .minLength))
            case .finished: XCTAssert(false)
            }
        }, receiveValue: { value in
            XCTAssert(false)
        }).store(in: &bag)
        wait(for: [expectation], timeout: 1)
    }
}
