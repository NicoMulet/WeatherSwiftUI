//
//  WeatherForecastDetail.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct WeatherDailyForecastDetailView: View {
    
    @ObservedObject var temperatureData: TemperatureData
    
    var weatherDailyForecast: WeatherForecastDetail
    
    var body: some View {
        HStack {
            Text(weatherDailyForecast.date.dayOfTheWeek)
            
            Spacer()
            WeatherIcon(imageData: ImageData(icon: weatherDailyForecast.weather[0].icon.replacingOccurrences(of: "n", with: "d")))
                .frame(width: 35.0, height: 35.0, alignment: .center)
                .padding(.trailing, 70.0)
            
            TemperatureView(tempMin: temperatureData.temperature(weatherDailyForecast.main.tempMin),
                            tempMax: temperatureData.temperature(weatherDailyForecast.main.tempMax))
        }
    }
}
