//
//  WeatherForecast.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Foundation
import SwiftUI

struct WeatherForecastDetail: Codable, Identifiable {
    let id = UUID()
    
    let dt: TimeInterval
    var date: Date {
        return Date(timeIntervalSince1970: dt)
    }
    let dt_txt: String
    let clouds: Cloud
    let wind: Wind
    let weather: [Weather]
    var rain: Rain?
    
    struct Main: Codable {
        let temp: Double
        var temperature: Kelvin {
            return Kelvin(kelvin: temp)
        }
        
        var temp_min: Double
        var tempMin: Kelvin {
            return Kelvin(kelvin: temp_min)
        }
        
        var temp_max: Double
        var tempMax: Kelvin {
            return Kelvin(kelvin: temp_max)
        }
        
        let pressure: Float
        let sea_level: Float
        let grnd_level: Float
        let humidity: Int
        let temp_kf: Double
    }
    
    var main: Main
}

extension WeatherForecastDetail: Equatable {
    static func == (lhs: WeatherForecastDetail, rhs: WeatherForecastDetail) -> Bool {
        return Date(timeIntervalSince1970: lhs.dt).dayOfTheWeek == Date(timeIntervalSince1970: rhs.dt).dayOfTheWeek
    }
}

let weatherForecastSample = WeatherForecastDetail(dt: 1553709600,
                                                  dt_txt: "2019-03-27 18:00:00",
                                                  clouds: Cloud(all: 77),
                                                  wind: Wind(speed: 1.6, deg: 40.932),
                                                  weather: [Weather(id: 803,
                                                                    main: "Clouds",
                                                                    description: "Broken clouds",
                                                                    icon: "04n")],
                                                  main: WeatherForecastDetail.Main(temp: 278.76,
                                                                                   temp_min: 278.76,
                                                                                   temp_max: 279.558,
                                                                                   pressure: 1031,
                                                                                   sea_level: 1031.934,
                                                                                   grnd_level: 971.745,
                                                                                   humidity: 100,
                                                                                   temp_kf: -0.8))
