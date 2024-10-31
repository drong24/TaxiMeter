//
//  ContentView.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 10/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Trip Fare", destination: {TripFare()})
                NavigationLink("History", destination: {TripHistoryView()})
                NavigationLink("Settings", destination: {TripFare()})

            }
            .listStyle(.grouped)
            .navigationTitle("Home")
        }
    }
}

#Preview {
    ContentView()
}
