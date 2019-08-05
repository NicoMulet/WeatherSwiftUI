//
//  PageView.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 28/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct PageView: View {
    var temperatureData: TemperatureData
    var allWeathers: [AllWeather]
    var viewControllers: [UIHostingController<WeatherCityView>]
    var firstIndex: Int

    init(temperatureData: TemperatureData, allWeathers: [AllWeather], firstIndex: Int) {
        let weatherCityViews = allWeathers.map { WeatherCityView(temperatureData: temperatureData, allWeather: $0) }
        self.viewControllers = weatherCityViews.map { UIHostingController(rootView: $0) }
        self.temperatureData = temperatureData
        self.allWeathers = allWeathers
        self.firstIndex = firstIndex
    }

    var body: some View {
        VStack(spacing: -16) {
            PageViewController(controllers: viewControllers, firstIndex: firstIndex)
            BottomBar()
        }
    }
}
