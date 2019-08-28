//
//  WeatherAPIServiceTests.swift
//  SwiftUISample
//
//  Created by Taillook on 2019/08/04.
//  Copyright © 2019 Taillook. All rights reserved.
//

import XCTest
@testable import SwiftUISample

class WeatherAPIServiceTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testloadWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?APPID=ade6ba106d7dad5e2178fc00335ba35b&zip=150-0002,JP") else {
            fatalError("URL is not correct!")
        }

        WeatherAPIService().loadWeather(url: url) { response in
            XCTAssertEqual(response?.main, "")
        }
    }
}
