//
//  TripFare.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 10/26/24.
//

import SwiftUI
import MapKit

struct TripFare: View {
    @StateObject var locationDataManager = LocationDataManager()
    var pricePerMile: Double = 2.50
    var initialFee: Double = 50.00
    var totalFaree: Double = 0
    let mileConversionRate = 0.000621371
    @State var trackingStarted = false
    
    var body: some View {
        @State var distanceTraveled = locationDataManager.distanceTraveled * mileConversionRate
        @State var cameraPos: MapCameraPosition = .userLocation(fallback: .automatic)
        
            switch locationDataManager.locationManager.authorizationStatus {
            case .authorizedWhenInUse:
                    List {
                        HStack {
                            Text("Trip Fare")
                            Spacer()
                            Text("⚙️")
                            Text("📄")
                        }
                        .padding()
                        .bold()
                        .font(.system(size: 30))
                        /*
                         Text("Your current location is:")
                         Text("lat: \(locationDataManager.locationManager.location?.coordinate.latitude.description ?? "Error")")
                         Text("lng: \(locationDataManager.locationManager.location?.coordinate.longitude.description ?? "Error")")
                         */
                        Text("Distance Traveled: \(String(format:"%.2f", distanceTraveled)) mi")
                            .padding()
                            .bold()
                            .font(.system(size: 30))
                        Text("Price Per Mile: \(String(format: "%.2f",pricePerMile))")
                            .padding()
                            .bold()
                            .font(.system(size: 30))
                        Text("Initial fee: $\(String(format: "%.2f", initialFee))")
                            .padding()
                            .bold()
                            .font(.system(size: 30))
                        Text("Total fare: $\(String(format: "%.2f",distanceTraveled * pricePerMile + initialFee))")
                            .padding()
                            .bold()
                            .font(.system(size: 30))
                        Spacer()
                        if !trackingStarted {
                            Button("Start Location Tracking", action: {
                                locationDataManager.start()
                                trackingStarted.toggle()
                            })
                        }
                        else {
                            Button("Stop Location Tracking", action: {
                                locationDataManager.stop()
                                trackingStarted.toggle()
                            })
                        }
                        Button("Complete Trip", action: {
                            trackingStarted = false
                            locationDataManager.reset()
                        })
                    }
                    .listStyle(.grouped)
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

#Preview {
    TripFare()
}
