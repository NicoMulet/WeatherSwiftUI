//
//  WeatherForecastList.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct WeatherDailyForecastList: View {
    
    var temperatureData: TemperatureData
    var weatherForecastList: [WeatherForecastDetail]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            ForEach(weatherForecastList) { weatherForecast in
                WeatherDailyForecastDetailView(temperatureData: self.temperatureData,
                                               weatherDailyForecast: weatherForecast)
            }
        }
    }
}
