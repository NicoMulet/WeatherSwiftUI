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
    var cities = [String]()
    
    @Published var allWeathers = [AllWeather]()
    
    init() {
        locationManager = CLLocationManager()
        unarchiveCities()
        
        locationManager.requestWhenInUseAuthorization()
    }
    
    func addCity(_ city: String) {
        cities.append(city)
        
        archiveCities()
        fetchAll()
    }
    
    func fetchAll() {
        if CLLocationManager.locationServicesEnabled(), let location = locationManager.location {
            CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
                if let currentCity = placemarks?.first?.locality, !self.cities.contains(currentCity) {
                    self.cities.insert(currentCity, at: 0)
                }
                
                self.fetch()
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
    
    private func unarchiveCities() {
        do {
            if let citiesData = UserDefaults.standard.data(forKey: "cities"),
                let cities = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(citiesData) as? [String] {
                self.cities = cities
            }
        } catch {
            #if DEBUG
            print("Cannot unarchive cities data")
            #endif
        }
    }
    
    private func archiveCities() {
        do {
            let encodedCities = try NSKeyedArchiver.archivedData(withRootObject: cities, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedCities, forKey: "cities")
            UserDefaults.standard.synchronize()
        } catch {
            #if DEBUG
            print("Cannot archive cities data")
            #endif
        }
    }
}
