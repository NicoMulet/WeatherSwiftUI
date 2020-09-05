//
//  AllWeather.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 01/08/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Foundation

struct AllWeather: Identifiable {
    
    let id = UUID()
    
    let weatherDetail: WeatherDetail
    let weatherHourlyForecast: WeatherForecast
    let weatherDailyForecast: WeatherForecast
}
