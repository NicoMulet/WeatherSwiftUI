//
//  WeatherCityView.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct WeatherCityContainer: View {
    var weatherDetail: WeatherDetail
    var weatherDailyForecast: WeatherForecast
    var weatherHourlyForecast: WeatherForecast
    
    var body: some View {
        List {
            WeatherDetailTitleView(weatherDetail: weatherDetail)
            WeatherHourlyForecastList(weatherHourlyForecastList: Array(weatherHourlyForecast.list.prefix(24)))
            WeatherDailyForecastList(weatherForecastList: weatherDailyForecast.list)
            WeatherDescription(description: weatherDetail.weather[0].description,
                               currentTemp: weatherDetail.main.temperature.toCelsius(),
                               maxTemp: weatherDetail.main.tempMax.toCelsius())
            WeatherDetailStack(weatherDetail: weatherDetail).padding()
        }
    }
}

#if DEBUG
struct WeatherCityContainer_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCityContainer(weatherDetail: sampleWeatherDetail,
                             weatherDailyForecast: WeatherForecast(list: [weatherForecastSample,
                                                                          weatherForecastSample,
                                                                          weatherForecastSample]),
                             weatherHourlyForecast: WeatherForecast(list: [weatherForecastSample,
                                                                           weatherForecastSample,
                                                                           weatherForecastSample]))
    }
}
#endif
