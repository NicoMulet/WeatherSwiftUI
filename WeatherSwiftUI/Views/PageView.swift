//
//  PageView.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 28/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct PageView: View {
    @ObjectBinding var cityData: CityData
    var viewControllers: [UIHostingController<WeatherCityView>]

    init(cityData: CityData) {
        let weatherCityViews = cityData.cities.map { WeatherCityView(weatherCityStore: WeatherCityData(city: $0)) }
        self.viewControllers = weatherCityViews.map { UIHostingController(rootView: $0) }
        self.cityData = cityData
    }

    var body: some View {
        PageViewController(controllers: viewControllers)
    }
}

struct PageView_Preview: PreviewProvider {
    static var previews: some View {
        PageView(cityData: CityData())
    }
}
