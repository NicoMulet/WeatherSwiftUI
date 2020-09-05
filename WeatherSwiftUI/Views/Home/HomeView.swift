//
//  HomeView.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 01/08/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var cityData: CityData
    
    var body: some View {
        Group {
            if cityData.cities.count != cityData.allWeathers.count {
                LoadingView()
            } else {
                CityList(temperatureData: TemperatureData(), cityData: cityData)
            }
        }.onAppear(perform: cityData.fetchAll)
    }
}
