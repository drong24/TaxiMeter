//
//  TaxiMeterView.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 11/8/24.
//

import SwiftUI

struct TaxiMeterView: View {
    
    @StateObject var historyVM = HistoryViewModel()
    @StateObject var settingsVM = SettingsViewModel()
    @StateObject var locationDataManager = LocationDataManager()
    
    @State var trackingStarted = false
    @State var refresher = false
    
    @AppStorage("distanceUnit") var distanceUnit = "Mi"
    @AppStorage("currency") var currency = "USD"
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var waitTime = 0
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    HStack {
                        NavigationLink(destination: HistoryView()) {
                            Image(systemName: "clock")
                                .imageScale(.large)
                        }
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "line.3.horizontal")
                                .imageScale(.large)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)

                    Text("Yellow Taxi")
                        .bold()
                        .font(.system(size: 40, design: .monospaced))
                        .foregroundColor(Color.yellow)
                    
                    Spacer()
                    TaxiMeterDetailsView(distanceTraveled: $locationDataManager.distanceTraveled)
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
                        historyVM.saveData(trip: TripModel(
                            distance: locationDataManager.distanceTraveled,
                            rate: Double(settingsVM.getFareRate())!,
                            initialFee: Double(settingsVM.getInitialFee())!,
                            toll: Double(settingsVM.getTolls())!,
                            waitTimeFee: Double(waitTime),
                            distanceUnit: distanceUnit,
                            currency: currency
                        ))
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
                .onReceive(timer) { time in
                    if  trackingStarted && locationDataManager.locationDifference < 5 {
                        waitTime += 1
                    }
                    print("\(waitTime) - \(locationDataManager.locationDifference)")
                }
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
