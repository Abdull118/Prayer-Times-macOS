//
//  InputView.swift
//  Prayer Times
//
//  Created by Arash Naimi on 5/20/23.
//

import Foundation
import SwiftUI

struct InputView: View {
    @Binding var locationData: LocationModel // Binding to update the userData
    @Binding var isDataStored: Bool
    
    var body: some View {
        VStack {
            TextField("Enter City", text: $locationData.city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Enter Country", text: $locationData.country)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                // Store user data in UserDefaults
                let defaults = UserDefaults.standard
                defaults.set(locationData.city, forKey: "city")
                defaults.set(locationData.country, forKey: "country")
                
                // Update isDataStored
                isDataStored = true
                
                // Verify if data was stored
                if let storedCity = defaults.string(forKey: "city"),
                   let storedCountry = defaults.string(forKey: "county") {
                    print("Data stored successfully:")
                    print("City: \(storedCity)")
                    print("Country: \(storedCountry)")
                } else {
                    print("Failed to store data.")
                }
            }) {
                Text("Submit")
            }
            .padding()

        }
    }
}


