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
            case .notDetermined:
                Text("Finding your location...")
                ProgressView()
            case .restricted, .denied:
                Text("Access to location data was restricted or denied.")
            case .authorizedWhenInUse:
                Text("Your current location is:")
                Text("lat: \(locationDataManager.locationManager.location?.coordinate.latitude.description ?? "Error")")
                Text("lng: \(locationDataManager.locationManager.location?.coordinate.longitude.description ?? "Error")")
                Text("Distance Traveled: \(distanceTraveled)")
                Button("Start Location Tracking", action: {
                    
                })
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
