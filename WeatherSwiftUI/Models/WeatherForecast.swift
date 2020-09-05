//
//  WeatherForecast.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Foundation
import SwiftUI

struct WeatherForecast: Codable, Identifiable {
    
    let id = UUID()
    
    var list: [WeatherForecastDetail]
}
