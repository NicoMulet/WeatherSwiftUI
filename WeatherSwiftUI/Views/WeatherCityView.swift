//
//  WeatherCityView.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct WeatherCityView: View {
    var allWeather: AllWeather
    
    var body: some View {
        Group {
            WeatherCityContainer(allWeather: allWeather)
        }
    }
}
