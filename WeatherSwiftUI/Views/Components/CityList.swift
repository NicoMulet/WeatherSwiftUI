//
//  CityList.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 01/08/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct CityList: View {
    var allWeathers: [AllWeather]
    
    var body: some View {
        NavigationView {
            List(allWeathers) { allWeather in
                NavigationLink(destination: PageView(allWeathers: self.allWeathers)) {
                    CityCell(allWeather: allWeather)
                }
            }.navigationBarTitle(Text("Cities"))
        }
    }
}
