//
//  Wind.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Foundation

struct Wind: Codable {
    
    let speed: Float
    let deg: Float?
    
    enum Direction: String {
        case north = "N"
        case northEast = "NE"
        case east = "E"
        case southEast = "SE"
        case south = "S"
        case southWest = "SW"
        case west = "W"
        case northWest = "NW"
        
        init(deg: Float) {
            if deg < 23 || deg > 337 {
                self = .north
            } else if deg < 68 {
                self = .northEast
            } else if deg < 113 {
                self = .east
            } else if deg < 158 {
                self = .southEast
            } else if deg < 203 {
                self = .south
            } else if deg < 248 {
                self = .southWest
            } else if deg < 293 {
                self = .west
            } else {
                self = .northWest
            }
        }
    }
    
    var direction: String? {
        guard let deg = deg else { return nil }
        return Direction(deg: deg).rawValue
    }
}
