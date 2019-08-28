//
//  WeatherAPIViewModel.swift
//  SwiftUISample
//
//  Created by Taillook on 2019/08/04.
//  Copyright © 2019 Taillook. All rights reserved.
//

import SwiftUI
import Combine

class WeatherAPIViewModel: BindableObject {

    let didChange = PassthroughSubject<WeatherAPIViewModel,Never>()
    let placeholderImage = UIImage.clearImage(size: CGSize(width: 80, height: 80))!
    
    init() {
        fetchWeather()
    }
    
    var weatherData: WeatherAPIModel? = nil {
        didSet {
            didChange.send(self)
        }
    }
    
    private(set) var image: UIImage = UIImage(systemName: "photo")! {
        didSet {
            didChange.send(self)
        }
    }
    
    private func fetchWeather() {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?APPID=ade6ba106d7dad5e2178fc00335ba35b&zip=150-0002,JP") else {
            fatalError("URL is not correct!")
        }

        WeatherAPIService().loadWeather(url: url) { weatherData in
            
            if let weatherData = weatherData {
                self.weatherData = weatherData
                self.downloadWebImage()
            }
        }
    }
    
    func downloadWebImage() {
        print("https://openweathermap.org/img/w/" + icon() + ".png")
        guard let url = URL(string: "https://openweathermap.org/img/w/" + icon() + ".png") else {
            print("Invalid URL.")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                self.image = image
                }
            } else {
                print("error: \(String(describing: error))")
            }
            }.resume()
    }
}

extension WeatherAPIViewModel {
    enum Coord {
        case lon
        case lat
    }
    
    func title() -> String {
        return weatherData?.mainWeather.main ?? "None"
    }
    
    func description() -> String {
        return weatherData?.mainWeather.description ?? "None"
    }
    
    func icon() -> String {
        return weatherData?.mainWeather.icon ?? ""
    }
    
    func coord(coord: Coord ) -> Double {
        switch coord {
            case Coord.lon:
                return Double(weatherData?.coord.lon ?? 0.0)
            case Coord.lat:
                return Double(weatherData?.coord.lat ?? 0.0)
        }
    }
}
