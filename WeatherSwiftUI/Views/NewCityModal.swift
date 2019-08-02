//
//  NewCityModal.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 02/08/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI

struct NewCityModal: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var city: String = ""

    var body: some View {
        VStack {
            Text("Enter city, postcode or airport location")
                .font(.caption)
            
            HStack {
                TextField("Search", text: $city, onCommit: addNewCity)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if !city.isEmpty {
                    Button(action: {
                        self.city = ""
                        self.presentationMode.value.dismiss()
                    }) {
                        Text("Cancel")
                            .foregroundColor(.primary)
                    }.animation(.default)
                }
            }
            
            Divider()
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
    }
    
    func addNewCity() {
        guard !city.isEmpty else { return }
        
        // TODO: Add city to CityData
        
        presentationMode.value.dismiss()
    }
}
