//
//  PageView.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 28/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct PageView: View {
    var allWeathers: [AllWeather]
    var viewControllers: [UIHostingController<WeatherCityView>]

    init(allWeathers: [AllWeather]) {
        let weatherCityViews = allWeathers.map { WeatherCityView(allWeather: $0) }
        self.viewControllers = weatherCityViews.map { UIHostingController(rootView: $0) }
        self.allWeathers = allWeathers
    }

    var body: some View {
        ZStack {
            PageViewController(controllers: viewControllers)
            BottomBar()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
        }
    }
}
