//
//  XCTestCase+Helpers.swift
//  Assignment_SaltsideUITests
//
//  Created by Utkarsh Sehgal on 08/03/21.
//

import XCTest

extension XCTestCase {
    //Wait for the element to be loaded then check for its existence
    func waitForElementToAppear(_ element: XCUIElement,
                                file: StaticString,
                                line: UInt,
                                elementName: String,
                                timeout: TimeInterval = 5.0) {
        let predicate = NSPredicate(format: "exists == true")
        let existsExpectation = expectation(for: predicate,
                                            evaluatedWith: element,
                                            handler: nil)
        let result = XCTWaiter().wait(for: [existsExpectation],
                                      timeout: timeout)
        
        guard result == .completed else {
            let failureMessage = "\(elementName) should be present)"
            XCTFail(failureMessage, file: file, line: line)
            return
        }
    }
}
