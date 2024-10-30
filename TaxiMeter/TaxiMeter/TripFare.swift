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
                VStack {
                    /*
                     Text("Your current location is:")
                     Text("lat: \(locationDataManager.locationManager.location?.coordinate.latitude.description ?? "Error")")
                     Text("lng: \(locationDataManager.locationManager.location?.coordinate.longitude.description ?? "Error")")
                     */
                    VStack {
                        Text("Distance Traveled:")
                        Text("\(String(format:"%.2f", distanceTraveled)) mi")
                            .bold()
                            .font(.system(size: 30))
                    }
                    
                    VStack {
                        Text("Price Per Mile:")
                        Text("\(String(format: "%.2f",pricePerMile))")
                            .bold()
                            .font(.system(size: 30))
                        
                        VStack {
                            Text("Initial fee:")
                            Text("\(String(format: "%.2f", initialFee))")
                                .bold()
                                .font(.system(size: 30))
                            
                            
                            Text("Total fare:")
                            Text("\(String(format: "%.2f",distanceTraveled * pricePerMile + initialFee))")
                                .bold()
                                .font(.system(size: 30))
                            
                            
                            if !trackingStarted {
                                Button("Start Tracking", action: {
                                    locationDataManager.start()
                                    trackingStarted.toggle()
                                })
                                .padding()
                                .cornerRadius(3.0)
                                .background(.red)
                                .foregroundColor(.white)
                                
                            }
                            else {
                                Button("Stop Tracking", action: {
                                    locationDataManager.stop()
                                    trackingStarted.toggle()
                                    
                                })
                                .padding()
                                .cornerRadius(3.0)
                                .background(.red)
                                .foregroundColor(.white)
                                
                            }
                            Button("Complete Trip", action: {
                                trackingStarted = false
                                locationDataManager.reset()
                            })
                            .padding()
                            .border(Color.red, width: 1)
                        }
                        .listStyle(.grouped)
                        .navigationTitle("Taxi")
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
                .background(Color.black)
                .foregroundStyle(Color.red)
                    
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
