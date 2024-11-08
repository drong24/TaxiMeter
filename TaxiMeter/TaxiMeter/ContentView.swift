//
//  ContentView.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 10/26/24.
//

import SwiftUI
import MapKit

struct ContentView: View {

    @StateObject var locationDataManager = LocationDataManager()
    
    var body: some View {

        
        NavigationView {
            switch locationDataManager.locationManager.authorizationStatus {
            case .authorizedWhenInUse:
                TaxiMeterView()
            case .notDetermined:
                Text("Finding your location...")
                ProgressView()
            case .restricted, .denied:
                Text("Access to location data was restricted or denied.")
            default:
                ProgressView()
            }
        }
    }
}

#Preview {
    ContentView()
}

