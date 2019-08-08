//
//  Date.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Foundation

extension Date {
    var dayOfTheWeek: String {
        let dateFormatter = DateFormatter.shared
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self) 
    }
    
    var hourAndDay: String {
        let dateFormatter = DateFormatter.shared
        dateFormatter.dateFormat = "EEEE hh a"
        return dateFormatter.string(from: self)
    }
    
    var hourOfTheDay: String {
        let dateFormatter = DateFormatter.shared
        dateFormatter.dateFormat = "HH"
        return dateFormatter.string(from: self)
    }
    
    var timeOfTheDay: String {
        let dateFormatter = DateFormatter.shared
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
}

extension DateFormatter {
    static var shared: DateFormatter = {
        return DateFormatter()
    }()
}
