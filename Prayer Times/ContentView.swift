//
//  ContentView.swift
//  Prayer Times
//
//  Created by Arash Naimi on 5/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var locationData = LocationModel(city: "", country: "") // Store user data
    @State private var isDataStored = false // Check if data is stored
    @ObservedObject var fetcher = PrayerTimesFetcher()
    
    var body: some View {
          Group {
              if !isDataStored {
                  InputView(locationData: $locationData, isDataStored: $isDataStored)
              } else {
                  VStack {
                              Button(action: {
                                  fetcher.getPrayerTimes(for: locationData.city, in: locationData.country)
                              }) {
                                  Text("Fetch Prayer Times")
                              }
                              
                              if let timings = fetcher.timings {
                                  Text("Fajr: \(convertTo12Hour(time24: timings.Fajr))")
                                  Text("Dhuhr: \(convertTo12Hour(time24: timings.Dhuhr))")
                                  Text("Asr: \(convertTo12Hour(time24: timings.Asr))")
                                  Text("Maghrib: \(convertTo12Hour(time24: timings.Maghrib))")
                                  Text("Isha: \(convertTo12Hour(time24: timings.Isha))")
                              }
                          }
                      }
              
          }
          .onAppear(perform: checkForData) // Call checkForData() when ContentView appears
      }
    
    func checkForData() {
        let defaults = UserDefaults.standard
        
        if let city = defaults.string(forKey: "city"),
           let country = defaults.string(forKey: "country") {
            // Data is stored in UserDefaults
            locationData.city = city
            locationData.country = country
            isDataStored = true
        } else {
            // Data is not stored
            isDataStored = false
        }
    }
}
