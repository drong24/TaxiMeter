//
//  ContentView.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 10/26/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationDataManager = LocationDataManager()

    var body: some View {
        @State var distanceTraveled = locationDataManager.distanceTraveled
        
        VStack {
            switch locationDataManager.locationManager.authorizationStatus {
            case .authorizedWhenInUse:
                /*
                Text("Your current location is:")
                Text("lat: \(locationDataManager.locationManager.location?.coordinate.latitude.description ?? "Error")")
                 Text("lng: \(locationDataManager.locationManager.location?.coordinate.longitude.description ?? "Error")")
                 */
                Text("Distance Traveled: \(String(format:"%.2f", distanceTraveled))")
                Text("Price Per Mile: ")
                Text("Initial fee: ")
                Text("Total fare: ")
                Button("Start Location Tracking", action: {
                    
                })
            case .notDetermined:
                Text("Finding your location...")
                ProgressView()
            case .restricted, .denied:
                Text("Access to location data was restricted or denied.")
            default:
                ProgressView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
