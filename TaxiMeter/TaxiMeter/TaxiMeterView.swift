//
//  TaxiMeterView.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 11/8/24.
//

import SwiftUI

struct TaxiMeterView: View {
    
    
    @StateObject var locationDataManager = LocationDataManager()
    var totalFare: Double = 0

    let mileConversionRate = 0.621371
    @State var trackingStarted = false
    @AppStorage("fareRate") var fareRate = "2.50"
    @AppStorage("initialFee") var initialFee = "3.50"
    @AppStorage("showDistance") var showDistance = false
    @AppStorage("showfareRate") var showFareRate = false
    @AppStorage("showInitialFee") var showInitialFee = false
    @AppStorage("TotalFareTextSize") var TotalFareTextSize = "60"
    @AppStorage("distanceUnit") var distanceUnit = "Mi"
    @AppStorage("currency") var currency = "USD"
    
    var body: some View {
        
        
        @State var distanceTraveled : Double = locationDataManager.distanceTraveled
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .frame(maxWidth: .infinity, alignment: .trailing)

                    }

                    Text("Yellow Taxi")
                        .bold()
                        .font(.system(size: 40, design: .monospaced))
                        .foregroundColor(Color.yellow)
                    
                    Spacer()
                    if (showDistance) {
                        Text("Distance Traveled:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 30/*10*/, design: .monospaced))
                        if (distanceUnit == "Mi") {
                            Text("\(String(format:"%.2f", distanceTraveled * mileConversionRate)) \(distanceUnit)")
                                .bold()
                                .font(.system(size: 50/*25*/, design: .monospaced))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        else {
                            Text("\(String(format:"%.2f", distanceTraveled)) \(distanceUnit)")
                                .bold()
                                .font(.system(size: 50/*25*/, design: .monospaced))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }

                    }
                    if (showFareRate) {
                        Text("Price Per Mile:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 30/*10*/, design: .monospaced))
                        Text(Double(fareRate) ?? 0, format: .currency(code: currency))
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 50/*25*/, design: .monospaced))
                    }
                    if (showInitialFee) {
                        Text("Initial fee:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 30/*10*/, design: .monospaced))
                        Text(Double(initialFee) ?? 0, format: .currency(code: currency))
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 50/*25*/, design: .monospaced))
                    }
                    Text("Total fare:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 30, design: .monospaced))
                    Text((distanceTraveled * (Double(fareRate) ?? 0) + (Double(initialFee) ?? 0)), format: .currency(code: currency))
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: Double(TotalFareTextSize)!, design: .monospaced))
                    Spacer()
                    if !trackingStarted {
                        Button("Start Tracking", action: {
                            locationDataManager.start()
                            trackingStarted.toggle()
                        })
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 34/255,green: 139/255, blue: 34/255))
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
                        //locationDataManager.save()
                        locationDataManager.reset()
                    })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .border(Color(red: 1,green: 1, blue: 1))
                    
                }
                .padding()
                .frame(minWidth: geometry.size.width,minHeight: geometry.size.height)
                .background(Color.black)
                .foregroundStyle(Color(red: 247,green: 0, blue: 0))
            }
            .frame(minWidth: geometry.size.width,minHeight: geometry.size.height)
            .background(Color.black)
            .foregroundStyle(Color(red: 247,green: 0, blue: 0))
        }
    }
}

#Preview {
    TaxiMeterView()
}
