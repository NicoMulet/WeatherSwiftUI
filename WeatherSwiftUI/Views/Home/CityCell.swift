//
//  CityCell.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 01/08/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct CityCell: View {
    @ObservedObject var temperatureData: TemperatureData
    var allWeather: AllWeather
    var isCurrentLocation: Bool
    
    var body: some View {
        HStack {
            if isCurrentLocation {
                HStack {
                    Text("\(allWeather.weatherDetail.name)")
                    .font(.title)
                    Image(systemName: "location.fill")
                }
            } else {
                VStack(alignment: .leading) {
                    Text("\(allWeather.weatherDetail.date.timeOfTheDay)")
                        .font(.caption)
                    Text("\(allWeather.weatherDetail.name)")
                        .font(.title)
                }
            }
            
            Spacer()
            
            Text("\(temperatureData.temperature(allWeather.weatherDetail.main.temperature))°")
                .font(.largeTitle)
        }
    }
}
