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
    var initialFee: Double = 6.00
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
                   
                    Text("Distance Traveled:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 30, design: .monospaced))
                    Text("\(String(format:"%.2f", distanceTraveled)) mi")
                        .bold()
                        .font(.system(size: 50, design: .monospaced))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                        .background(Color.red)
                        
                    Text("Price Per Mile:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 30, design: .monospaced))
                    Text("\(String(format: "%.2f",pricePerMile))")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 50, design: .monospaced))
                    Divider()
                        .background(Color.red)
                    
                    Text("Initial fee:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 30, design: .monospaced))
                    Text("\(String(format: "%.2f", initialFee))")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 50, design: .monospaced))
                    Divider()
                        .background(Color.red)
                    
                    Text("Total fare:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 30, design: .monospaced))
                    Text("\(String(format: "%.2f",distanceTraveled * pricePerMile + initialFee))")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 50, design: .monospaced))
                    Spacer()
                    HStack {
                        NavigationLink(destination: TripHistoryView()) {
                            Image(systemName: "gearshape")
                                .imageScale(.large)
                            Text("Settings")
                        }
                            .padding(7)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0)
                                .stroke()
                            )
                        NavigationLink(destination: TripHistoryView()) {
                            Image(systemName: "clock")
                                .imageScale(.large)
                            Text("History")
                        }
                            .padding(7)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0)
                                .stroke()
                            )
                    }
                    Spacer()
                    if !trackingStarted {
                        Button("Start Tracking", action: {
                            locationDataManager.start()
                            trackingStarted.toggle()
                        })
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.red)
                        .foregroundColor(.white)
                        
                    }
                    else {
                        Button("Stop Tracking", action: {
                            locationDataManager.stop()
                            trackingStarted.toggle()
                                
                    })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.red)
                    .foregroundColor(.white)
                    
                    }
                    Button("Complete Trip", action: {
                        trackingStarted = false
                        locationDataManager.save()
                        locationDataManager.reset()
                    })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .border(Color.red, width: 1)
                    
                }
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity, alignment: .leading)
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
