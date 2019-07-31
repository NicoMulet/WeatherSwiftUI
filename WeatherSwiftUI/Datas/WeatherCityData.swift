//
//  WeatherCityData.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Combine
import SwiftUI

class WeatherCityData: ObservableObject {
    let city: String
    
    @Published var weatherDetail: WeatherDetail? = nil
    @Published var weatherDailyForecast: WeatherForecast? = nil
    @Published var weatherHourlyForecast: WeatherForecast? = nil
    
    init(city: String) {
        self.city = city
    }
    
    func fetch() {
        APIService.shared.GET(endpoint: .weather, params: ["q": city]) { (result: Result<WeatherDetail, APIService.APIError>) in
            switch result {
            case .success(_):
                if let weatherDetail = try? result.get() {
                    self.weatherDetail = weatherDetail
                    
                    if var weatherHourlyForecast = self.weatherHourlyForecast {
                        weatherHourlyForecast.list.insert(
                            WeatherForecastDetail(dt: weatherDetail.dt,
                                                  dt_txt: "",
                                                  clouds: weatherDetail.clouds,
                                                  wind: weatherDetail.wind,
                                                  weather: weatherDetail.weather,
                                                  rain: nil,
                                                  main: WeatherForecastDetail.Main(temp: weatherDetail.main.temp,
                                                                                   temp_min: weatherDetail.main.temp_min,
                                                                                   temp_max: weatherDetail.main.temp_max,
                                                                                   pressure: Float(weatherDetail.main.pressure),
                                                                                   sea_level: 0.0,
                                                                                   grnd_level: 0.0,
                                                                                   humidity: weatherDetail.main.humidity,
                                                                                   temp_kf: 0.0)),
                            at: 0)
                    }
                }
            case .failure(_):
                break
            }
        }
        
        APIService.shared.GET(endpoint: .dailyForecast, params: ["q": city]) { (result: Result<WeatherForecast, APIService.APIError>) in
            switch result {
            case .success(_):
                if var weatherForecast = try? result.get() {
                    var i = -1
                    var tmpDailyForecast = [WeatherForecastDetail]()

                    for weatherForecast in weatherForecast.list {
                        if weatherForecast.date.dayOfTheWeek == Date().dayOfTheWeek {
                            continue
                        } else if tmpDailyForecast.contains(weatherForecast) {
                            tmpDailyForecast[i].main.temp_min = min(tmpDailyForecast[i].main.temp_min,
                                                                    weatherForecast.main.temp_min)
                            tmpDailyForecast[i].main.temp_max = max(tmpDailyForecast[i].main.temp_max,
                                                                    weatherForecast.main.temp_max)
                        } else {
                            tmpDailyForecast.append(weatherForecast)
                            i += 1
                        }
                    }

                    self.weatherDailyForecast = weatherForecast
                    self.weatherDailyForecast?.list = tmpDailyForecast
                    
                    if let weatherDetail = self.weatherDetail {
                        weatherForecast.list.insert(
                            WeatherForecastDetail(dt: weatherDetail.dt,
                                                  dt_txt: "",
                                                  clouds: weatherDetail.clouds,
                                                  wind: weatherDetail.wind,
                                                  weather: weatherDetail.weather,
                                                  rain: nil,
                                                  main: WeatherForecastDetail.Main(temp: weatherDetail.main.temp,
                                                                                   temp_min: weatherDetail.main.temp_min,
                                                                                   temp_max: weatherDetail.main.temp_max,
                                                                                   pressure: Float(weatherDetail.main.pressure),
                                                                                   sea_level: 0.0,
                                                                                   grnd_level: 0.0,
                                                                                   humidity: weatherDetail.main.humidity,
                                                                                   temp_kf: 0.0)),
                            at: 0)
                    }
                    
                    self.weatherHourlyForecast = weatherForecast
                }
            case .failure(_):
                break
            }
        }
    }
}
