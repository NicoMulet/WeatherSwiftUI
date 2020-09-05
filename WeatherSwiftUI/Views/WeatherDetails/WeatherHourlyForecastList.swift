//
//  WeatherHourlyForecastList.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct WeatherHourlyForecastList: View {
    
    var temperatureData: TemperatureData
    var weatherHourlyForecastList: [WeatherForecastDetail]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0.0) {
                ForEach(weatherHourlyForecastList) { weatherHourlyForecast in
                    WeatherHourlyForecastDetailView(temperatureData: self.temperatureData,
                                                    weatherHourlyForecast: weatherHourlyForecast)
                }
            }.frame(height: 110.0)
        }
    }
}
