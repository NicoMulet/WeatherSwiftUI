//
//  CityData.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 28/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Combine
import MapKit

class CityData: ObservableObject {
    let locationManager: CLLocationManager
    var cities = ["Paris", "London", "New York"]
    
    @Published var allWeathers = [AllWeather]()
    
    init() {
        self.locationManager = CLLocationManager()
        
        locationManager.requestWhenInUseAuthorization()
    }
    
    func fetchAll() {
        if CLLocationManager.locationServicesEnabled(), let location = locationManager.location {
            CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
                if let currentCity = placemarks?.first?.locality {
                    self.cities.insert(currentCity, at: 0)
                    
                    self.fetch()
                }
            }
        } else {
            fetch()
        }
    }
    
    private func fetch() {
        allWeathers.removeAll()
        
        for city in cities {
            let weatherCityData = WeatherCityData(city: city)
            weatherCityData.fetch() {
                var tmpWeathers = [AllWeather]()
                tmpWeathers.append(AllWeather(weatherDetail: weatherCityData.weatherDetail!,
                                              weatherHourlyForecast: weatherCityData.weatherHourlyForecast!,
                                              weatherDailyForecast: weatherCityData.weatherDailyForecast!))
                
                tmpWeathers.forEach({ allWeather in
                    if let index = self.cities.firstIndex(of: allWeather.weatherDetail.name),
                        index <= self.allWeathers.count {
                        self.allWeathers.insert(allWeather, at: index)
                    } else {
                        self.allWeathers.append(allWeather)
                    }
                })
            }
        }
    }
}
