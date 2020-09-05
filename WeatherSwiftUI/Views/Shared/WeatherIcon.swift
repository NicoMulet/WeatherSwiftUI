//
//  WeatherIcon.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 28/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct WeatherIcon: View {
    
    @ObservedObject var imageData: ImageData
    
    var body: some View {
        Group {
            if let image = imageData.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 35.0, height: 35.0)
            } else {
                Rectangle()
                    .foregroundColor(.clear)
            }
        }.onAppear(perform: imageData.loadImage)
    }
}

#if DEBUG
struct WeatherIcon_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIcon(imageData: ImageData(icon: ""))
    }
}
#endif
