//
//  BigButton.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 05/08/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct BigButton: View {
    
    let action: () -> Void
    let imageName: String
    let text: String
    let color: Color
    
    var body: some View {
        Button(action: action, label: {
            HStack(alignment: .center) {
                Image(systemName: imageName)
                    .foregroundColor(.primary)
                Text(text)
                    .foregroundColor(.primary)
            }
        })
        .padding(6)
        .background(color)
        .cornerRadius(6)
    }
}

#if DEBUG
struct BigButton_Previews: PreviewProvider {
    static var previews: some View {
        BigButton(action: { }, imageName: "plus.app", text: "Add this new city", color: .blue)
    }
}
#endif
