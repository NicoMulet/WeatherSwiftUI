//
//  Weather.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Foundation
import SwiftUI

struct Weather: Codable, Identifiable {
    
    let id: Int
    let main: String
    let description: String
    let icon: String
}
