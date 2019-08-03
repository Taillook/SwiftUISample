//
//  EnvironmentParserTests.swift
//  SwiftUISample
//
//  Created by Taillook on 2019/08/03.
//  Copyright © 2019 Taillook. All rights reserved.
//

import XCTest
@testable import SwiftUISample

class EnvironmentParserTests: XCTestCase {
    
    override func setUp() {
    }
    
    override func tearDown() {
    }
    
    func testParse() {
        let result = EnvironmentParser().parse()
        XCTAssertEqual(result, true)
    }
    
}

