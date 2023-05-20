//
//  Prayer_TimesApp.swift
//  Prayer Times
//
//  Created by Arash Naimi on 5/20/23.
//

import SwiftUI

@main
struct Prayer_TimesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                            .onAppear {
                                ContentView().checkForData()
                            }
        }
    }
}
