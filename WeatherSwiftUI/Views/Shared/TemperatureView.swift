//
//  TemperatureView.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 28/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct TemperatureView: View {
    
    var tempMin: Int
    var tempMax: Int
    
    var body: some View {
        HStack(spacing: 20.0) {
            Text("\(tempMax)")
            Text("\(tempMin)").foregroundColor(.secondary)
        }
    }
}

#if DEBUG
struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView(tempMin: 10, tempMax: 20)
    }
}
#endif
