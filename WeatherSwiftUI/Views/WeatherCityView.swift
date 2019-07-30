//
//  WeatherCityView.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct WeatherCityView: View {
    @ObjectBinding var weatherCityStore: WeatherCityData
    
    var body: some View {
        Group {
            if weatherCityStore.weatherDailyForecast == nil
                || weatherCityStore.weatherHourlyForecast == nil
                || weatherCityStore.weatherDetail == nil {
                LoadingView()
            } else {
                WeatherCityContainer(weatherDetail: weatherCityStore.weatherDetail!,
                                     weatherDailyForecast: weatherCityStore.weatherDailyForecast!,
                                     weatherHourlyForecast: weatherCityStore.weatherHourlyForecast!)
            }
        }.onAppear(perform: weatherCityStore.fetch)
    }
}

#if DEBUG
struct WeatherCityView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCityView(weatherCityStore: WeatherCityData(city: "Paris"))
    }
}
#endif
