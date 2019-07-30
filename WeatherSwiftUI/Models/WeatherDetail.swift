//
//  WeatherDetail.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Foundation
import SwiftUI

struct WeatherDetail: Codable, Identifiable {
    let id: Int
    
    let name: String
    let dt: TimeInterval
    var date: Date {
        return Date(timeIntervalSince1970: dt)
    }
    
    let base: String
    let visibility: Int
    let clouds: Cloud
    let wind: Wind
    
    struct Coordinates: Codable {
        let lon: Float
        let lat: Float
    }
    
    let coord: Coordinates
    let weather: [Weather]
    
    struct Main: Codable {
        let temp: Double
        var temperature: Kelvin {
            return Kelvin(kelvin: temp)
        }
        let pressure: Int
        let humidity: Int
        let temp_min: Double
        var tempMin: Kelvin {
            return Kelvin(kelvin: temp_min)
        }
        
        let temp_max: Double
        var tempMax: Kelvin {
            return Kelvin(kelvin: temp_max)
        }
    }
    
    let main: Main
    
    struct Sys: Codable, Identifiable {
        let id: Int
        let type: Int
        let message: Float
        let country: String
        let sunrise: TimeInterval
        let sunset: TimeInterval
    }
    
    let sys: Sys
}

let sampleWeatherDetail = WeatherDetail(id: 0,
                                        name: "Paris",
                                        dt: 1485789600,
                                        base: "stations",
                                        visibility: 10000,
                                        clouds: Cloud(all: 90),
                                        wind: Wind(speed: 4.1, deg: 80),
                                        coord: WeatherDetail.Coordinates(lon: -0.13, lat: 51.51),
                                        weather: [Weather(id: 300,
                                                          main: "Drizzle",
                                                          description: "light intensity drizzle",
                                                          icon: "09d")],
                                        main: WeatherDetail.Main(temp: 280.32,
                                                                 pressure: 1012,
                                                                 humidity: 81,
                                                                 temp_min: 279.15,
                                                                 temp_max: 281.15),
                                        sys: WeatherDetail.Sys(id: 5091,
                                                               type: 1,
                                                               message: 0.0103,
                                                               country: "FR",
                                                               sunrise: 1485762037,
                                                               sunset: 1485794875))
