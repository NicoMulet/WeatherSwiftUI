//
//  WeatherDetailTitleView.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct WeatherDetailTitleView: View {
    
    @ObservedObject var temperatureData: TemperatureData
    var weatherDetail: WeatherDetail
    
    var body: some View {
        VStack(alignment: .center, spacing: 32.0) {
            VStack {
                Text(weatherDetail.name)
                    .font(.title)
                Text(weatherDetail.weather[0].main)
                    .font(.caption)
                Text("\(temperatureData.temperature(weatherDetail.main.temperature))°")
                    .font(.largeTitle)
            }
            
            HStack(alignment: .bottom, spacing: 12.0) {
                Text(weatherDetail.date.dayOfTheWeek)
                Text("TODAY").font(.headline)
                Spacer()
                
                TemperatureView(tempMin: temperatureData.temperature(weatherDetail.main.tempMin),
                                tempMax: temperatureData.temperature(weatherDetail.main.tempMax))
            }
        }
    }
}
