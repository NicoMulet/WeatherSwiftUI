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
    let deg: Float
    
    enum Direction: String {
        case North = "N"
        case NorthEast = "NE"
        case East = "E"
        case SouthEast = "SE"
        case South = "S"
        case SouthWest = "SW"
        case West = "W"
        case NorthWest = "NW"
        
        init(deg: Float) {
            if deg < 23 || deg > 337 {
                self = .North
            } else if deg < 68 {
                self = .NorthEast
            } else if deg < 113 {
                self = .East
            } else if deg < 158 {
                self = .SouthEast
            } else if deg < 203 {
                self = .South
            } else if deg < 248 {
                self = .SouthWest
            } else if deg < 293 {
                self = .West
            } else {
                self = .NorthWest
            }
        }
    }
    
    var direction: String {
        return Direction(deg: deg).rawValue
    }
}
