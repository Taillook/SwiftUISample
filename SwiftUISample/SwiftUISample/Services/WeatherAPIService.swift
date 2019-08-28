//
//  WeatherAPIService.swift
//  SwiftUISample
//
//  Created by Taillook on 2019/08/04.
//  Copyright © 2019 Taillook. All rights reserved.
//

import Foundation

class WeatherAPIService {
    func loadWeather(url: URL, completion: @escaping (WeatherAPIModel?) -> ()) {

        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            let response = try? JSONDecoder().decode(WeatherAPIModel.self, from: data)
            if let response = response {
                DispatchQueue.main.async {
                    completion(response)
                }
            }
        }.resume()
    }
}
