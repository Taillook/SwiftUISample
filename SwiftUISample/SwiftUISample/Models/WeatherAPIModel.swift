//
//  WeatherModel.swift
//  SwiftUISample
//
//  Created by Taillook on 2019/08/04.
//  Copyright © 2019 Taillook. All rights reserved.
//

import Foundation

struct WeatherAPIModel: Codable {
    var coord: Coord
    var weather: [Weather]
    
    struct Coord: Codable {
        var lon: Float = 0.0
        var lat: Float = 0.0
    }
    
    struct Weather: Codable {
        var id: Int = 0
        var main: String = ""
        var description: String = ""
        var icon: String = ""
    }
    
    var mainWeather: Weather {
        return self.weather[0]
    }
}
