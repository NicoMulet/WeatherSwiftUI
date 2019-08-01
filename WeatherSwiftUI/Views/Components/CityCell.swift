//
//  CityCell.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 01/08/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct CityCell: View {
    var allWeather: AllWeather
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(allWeather.weatherDetail.date.timeOfTheDay)")
                    .font(.caption)
                Text("\(allWeather.weatherDetail.name)")
                    .font(.title)
            }
            
            Spacer()
            
            Text("\(allWeather.weatherDetail.main.temperature.toCelsius())°")
                .font(.largeTitle)
        }
    }
}
