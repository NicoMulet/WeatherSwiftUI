//
//  WeatherHourlyForecastView.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct WeatherHourlyForecastDetailView: View {
    @ObservedObject var temperatureData: TemperatureData
    var weatherHourlyForecast: WeatherForecastDetail
    
    var body: some View {
        VStack(alignment: .center) {
            if weatherHourlyForecast.date.hourAndDay == Date().hourAndDay {
                Text("Now")
                    .bold()
                
                if weatherHourlyForecast.rain?.probability ?? 0.0 > 0.0 {
                    Text("\(Int((weatherHourlyForecast.rain?.probability ?? 0.0))) cm")
                        .font(.footnote)
                        .foregroundColor(.blue)
                } else {
                    Spacer()
                }
                
                WeatherIcon(imageData: ImageData(icon: weatherHourlyForecast.weather[0].icon))
                Text("\(temperatureData.temperature(weatherHourlyForecast.main.temperature))°")
            } else {
                Text(weatherHourlyForecast.date.hourOfTheDay)
                
                if weatherHourlyForecast.rain?.probability ?? 0.0 > 0.0 {
                    Text("\(Int((weatherHourlyForecast.rain?.probability ?? 0.0))) cm")
                        .font(.footnote)
                        .foregroundColor(.blue)
                } else {
                    Spacer()
                }
                
                WeatherIcon(imageData: ImageData(icon: weatherHourlyForecast.weather[0].icon))
                Text("\(temperatureData.temperature(weatherHourlyForecast.main.temperature))°")
            }
        }
        .frame(width: 50.0)
    }
}
