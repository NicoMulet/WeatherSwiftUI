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
                    ForEach(allWeathers) { allWeather in
                        NavigationLink(destination: PageView(temperatureData: self.temperatureData,
                                                             allWeathers: self.allWeathers,
                                                             firstIndex: self.allWeathers.firstIndex(where: {
                                                                $0.id == allWeather.id
                                                             }) ?? 0)) {
                            CityCell(temperatureData: self.temperatureData, allWeather: allWeather)
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
