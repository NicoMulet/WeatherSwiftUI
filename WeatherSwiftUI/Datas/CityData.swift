//
//  CityData.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 28/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Combine
import SwiftUI

class CityData: BindableObject {
    let willChange = PassthroughSubject<CityData, Never>()
    
    let cities = ["Paris", "London", "San Francisco"]
}
