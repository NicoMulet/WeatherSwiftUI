//
//  TemperatureData.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 02/08/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Combine

class TemperatureData: ObservableObject {
    
    @Published var temperatureUnit = 0
    
    func temperature(_ kelvinValue: Kelvin) -> Int {
        switch temperatureUnit {
        case 0:
            return kelvinValue.celsiusValue
        default:
            return kelvinValue.fahrenheitValue
        }
    }
}
