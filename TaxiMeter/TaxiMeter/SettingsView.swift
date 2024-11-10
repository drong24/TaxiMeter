//
//  TripHistoryView.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 10/30/24.
//

import SwiftUI
import Foundation

struct SettingsView: View {
        
    @AppStorage("tariff") var tariff = "2.50"
    @AppStorage("fareRate") var fareRate = "1.60"
    @AppStorage("initialFee") var initialFee = "5.54"
    @AppStorage("tolls") var tolls = "0.00"
    @AppStorage("distanceUnit") var distanceUnit = "Mi"
    @AppStorage("currency") var currency = "USD"
    @AppStorage("appTheme") var appTheme = "Classic Red"
    @AppStorage("showDistance") var showDistance = false
    @AppStorage("showfareRate") var showFareRate = false
    @AppStorage("showInitialFee") var showInitialFee = false
    @AppStorage("TotalFareTextSize") var TotalFareTextSize = "60"
    
    var currencies = ["USD", "EUR", "JPY", "GBP", "INR"]
    var unit = ["Mi", "Km"]
    var themes = ["Classic Red", "Classic Yellow", "White", "Inverted"]
    var textSize = ["50", "60", "80", "100"]
    
    var body: some View {
        List {
            Section("Tariffs") {
                HStack {
                    Text("Tariff:")
                    Spacer()
                    TextField(tariff, text: $tariff)
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
                HStack {
                    Text("Fare Rate:")
                    Spacer()
                    TextField(fareRate, text: $fareRate)
                        .frame(width: 100, alignment: .trailing)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
                HStack {
                    Text("Initial Fee:")
                    Spacer()
                    TextField(initialFee, text: $initialFee)
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
                HStack {
                    Text("Tolls:")
                    Spacer()
                    TextField(tolls, text: $tolls)
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
            }
            
            Section("Display") {
                Picker(selection: $distanceUnit, label: Text("Kilometers or Miles:")) {
                    ForEach(unit, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                Picker(selection: $currency, label: Text("Currency:")) {
                    ForEach(currencies, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                Toggle("Show Distance Traveled", isOn: $showDistance)
                Toggle("Show Rate", isOn: $showFareRate)
                Toggle("Show Initial Fee", isOn: $showInitialFee)
            }
            
            Section("Other Setings") {

                Picker(selection: $appTheme, label: Text("Color Scheme:")) {
                    ForEach(themes, id: \.self) {
                        Text($0)
                    }
                }
                Picker(selection: $TotalFareTextSize, label: Text("Total Fare Text Size:")) {
                    ForEach(textSize, id: \.self) {
                        Text($0)
                    }
                }

            }
            
            Section {
                Button("Reset Defaults", action: {
                    UserDefaults.standard.dictionaryRepresentation().keys.forEach { key in
                        UserDefaults.standard.removeObject(forKey: key)
                    }
                })
            }
        }
    }
}

#Preview {
    SettingsView()
}
