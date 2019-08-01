//
//  WeatherBottomBar.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 01/08/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct BottomBar: View {
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image(systemName: "list.bullet")
                        .foregroundColor(.primary)
                }
            }
        }
        .padding()
    }
}
