//
//  Kelvin.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 28/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Foundation

public struct Kelvin: Codable {
    private var kelvin: Double
    
    init(kelvin: Double) {
        self.kelvin = kelvin
    }
    
    func toCelsius() -> Int {
        return Int(kelvin - 273.15)
    }
    
    func toFahrenheit() -> Int {
        return Int((kelvin * 9 / 5) - 459.67)
    }
}

extension Kelvin: ExpressibleByFloatLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self.init(kelvin: value)
    }
}

extension Kelvin: Comparable {
    public static func < (lhs: Kelvin, rhs: Kelvin) -> Bool {
        return lhs.kelvin < rhs.kelvin
    }
}
