//
//  TaxiMeterDetailsView.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 11/26/24.
//

import SwiftUI

struct TaxiMeterDetailsView: View {
    
    @StateObject var settingsVM = SettingsViewModel()
    
    let mileConversionRate = 0.000621371
    @State var trackingStarted = false
    @State var refresher = false
    
    @AppStorage("showDistance") var showDistance = false
    @AppStorage("showfareRate") var showFareRate = false
    @AppStorage("showInitialFee") var showInitialFee = false
    @AppStorage("showWaitFee") var showWaitFee = false
    @AppStorage("TotalFareTextSize") var TotalFareTextSize = "60"
    @AppStorage("distanceUnit") var distanceUnit = "Mi"
    @AppStorage("currency") var currency = "USD"
    @AppStorage("presetChosen") var presetChosen = "1"
    
    @Binding var distanceTraveled : Double
    @Binding var waitTime : Int
    
    var body: some View {
        
        VStack {
            if (showDistance) {
                Text("Distance Traveled:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 30, design: .monospaced))
                if (distanceUnit == "Mi") {
                    Text("\(String(format:"%.2f", distanceTraveled * mileConversionRate)) \(distanceUnit)")
                        .bold()
                        .font(.system(size: 50, design: .monospaced))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else {
                    Text("\(String(format:"%.2f", distanceTraveled * 0.001)) \(distanceUnit)")
                        .bold()
                        .font(.system(size: 50, design: .monospaced))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }
            if (showFareRate) {
                Text("Price Per Mile:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 30, design: .monospaced))
                Text(Double(settingsVM.getFareRate()) ?? 0, format: .currency(code: currency))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 50, design: .monospaced))
            }
            if (showInitialFee) {
                Text("Initial fee:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 30, design: .monospaced))
                Text(Double(settingsVM.getInitialFee()) ?? 0, format: .currency(code: currency))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 50, design: .monospaced))
            }
            if (showWaitFee) {
                Text("Wait fee:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 30, design: .monospaced))
                Text(Double(settingsVM.getWaitFeeRate()) ?? 0 * Double(waitTime), format: .currency(code: currency))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 50, design: .monospaced))
            }
            Text("Total fare:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 30, design: .monospaced))
            Text((distanceTraveled * (Double(settingsVM.getFareRate()) ?? 0) + (Double(settingsVM.getInitialFee()) ?? 0) + (Double(settingsVM.getTolls()) ?? 0)), format: .currency(code: currency))
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: Double(TotalFareTextSize)!, design: .monospaced))
        }
        .onAppear {
            settingsVM.fetchData()
            refresher.toggle()
        }
    }
}

#Preview {
    TaxiMeterDetailsView(distanceTraveled: .constant(0.0), waitTime: .constant(0))
}
