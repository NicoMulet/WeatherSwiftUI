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
    var cityData: CityData
    
    @State var city: String = ""

    var body: some View {
        VStack {
            Text("Enter city, postcode or airport location")
                .font(.caption)
            
            HStack {
                TextField("Search", text: $city, onCommit: addNewCity)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if !city.isEmpty {
                    Button(action: closeModal) {
                        Text("Cancel")
                            .foregroundColor(.primary)
                    }.animation(.default)
                }
            }
            
            Divider()
            
            if !city.isEmpty {
                BigButton(action: addNewCity, imageName: "plus.app", text: "Add this new city", color: .blue)
                    .animation(.default)
            }
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
    }
    
    private func addNewCity() {
        guard !city.isEmpty else { return }
        
        cityData.addCity(city)
        
        closeModal()
    }
    
    private func closeModal() {
        presentationMode.wrappedValue.dismiss()
        city = ""
    }
}
