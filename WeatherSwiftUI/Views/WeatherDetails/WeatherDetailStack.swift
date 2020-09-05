//
//  WeatherDetail.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct WeatherDetailStack: View {
    
    var weatherDetail: WeatherDetail
    
    var body: some View {
        HStack(alignment: .top, spacing: 0.0) {
            VStack(alignment: .leading, spacing: 4.0) {
                WeatherDetailInformation(title: "SUNRISE", value: Date(timeIntervalSince1970: weatherDetail.sys.sunrise).timeOfTheDay)
                Divider()
                
                if let windDirection = weatherDetail.wind.direction {
                    WeatherDetailInformation(title: "WIND", value: "\(windDirection) \(Int(weatherDetail.wind.speed)) km/hr")
                }
                Divider()
                if let visibility = weatherDetail.visibility {
                    WeatherDetailInformation(title: "VISIBILITY", value: "\(visibility / 1000) km")
                }
            }
            
            VStack(alignment: .leading, spacing: 4.0) {
                WeatherDetailInformation(title: "SUNSET", value: Date(timeIntervalSince1970: weatherDetail.sys.sunset).timeOfTheDay)
                Divider()
                WeatherDetailInformation(title: "HUMIDITY", value: "\(weatherDetail.main.humidity) %")
                Divider()
                WeatherDetailInformation(title: "PRESSURE", value: "\(Int(weatherDetail.main.pressure)) hPa")
            }
        }
    }
}
