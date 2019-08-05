//
//  CityList.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 01/08/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct CityList: View {
    @ObservedObject var temperatureData: TemperatureData
    var allWeathers: [AllWeather]
    
    @State var showNewCityModal = false
    var degrees = ["°C", "°F"]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0 ..< allWeathers.count) { index in
                        NavigationLink(destination: PageView(temperatureData: self.temperatureData,
                                                             allWeathers: self.allWeathers,
                                                             currentPage: index)) {
                                CityCell(temperatureData: self.temperatureData,
                                         allWeather: self.allWeathers[index],
                                         isCurrentLocation: index == 0)
                        }
                    }
                    
                    HStack {
                        Picker("Degree choice", selection: $temperatureData.temperatureUnit) {
                            ForEach(0 ..< degrees.count) { index in
                                Text(self.degrees[index])
                                    .tag(index)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                        
                        Spacer()
                        
                        Button(action: {
                            self.showNewCityModal = true
                        }) {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.primary)
                        }
                    }
                }
                .navigationBarTitle(Text("Cities"))
            }
        }
        .sheet(isPresented: $showNewCityModal, content: { NewCityModal() })
    }
}
