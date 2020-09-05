//
//  WeatherDetailInformation.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 27/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct WeatherDetailInformation: View {
    
    var title: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text(title)
                .font(.caption)
            Text(value)
                .font(.headline)
        }
    }
}

#if DEBUG
struct WeatherDetailInformation_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailInformation(title: "WIND", value: "80° 33 km/hr")
    }
}
#endif
