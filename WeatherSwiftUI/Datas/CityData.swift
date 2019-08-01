//
//  CityData.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 28/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Combine
import SwiftUI

class CityData: ObservableObject {
    let cities = ["Paris", "London", "San Francisco"]
    
    @Published var allWeathers = [AllWeather]()
    
    func fetchAll() {
        for city in cities {
            let weatherCityData = WeatherCityData(city: city)
            weatherCityData.fetch() {
                self.allWeathers.append(AllWeather(weatherDetail: weatherCityData.weatherDetail!,
                                                   weatherHourlyForecast: weatherCityData.weatherHourlyForecast!,
                                                   weatherDailyForecast: weatherCityData.weatherDailyForecast!))
            }
        }
    }
}
