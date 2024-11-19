//
//  TripHistoryView.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 10/30/24.
//

import SwiftUI
import Foundation

struct SettingsView: View {
            
    @AppStorage("distanceUnit") var distanceUnit = "Mi"
    @AppStorage("currency") var currency = "USD"
    @AppStorage("appTheme") var appTheme = "Classic Red"
    @AppStorage("showDistance") var showDistance = false
    @AppStorage("showfareRate") var showFareRate = false
    @AppStorage("showInitialFee") var showInitialFee = false
    @AppStorage("TotalFareTextSize") var TotalFareTextSize = "60"
    @AppStorage("presetChosen") var presetChosen = "1"
    
    @State var refresher = false
    var tariffPresets = ["1", "2", "3"]
    var currencies = ["USD", "EUR", "JPY", "GBP", "INR"]
    var unit = ["Mi", "Km"]
    var themes = ["Classic Red", "Classic Yellow", "White", "Inverted"]
    var textSize = ["50", "60", "80", "100"]
    
    var body: some View {
        List {
            Section("Tariffs") {
                Picker(selection: $presetChosen, label: Text("")) {
                    ForEach(tariffPresets, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .onChange(of: presetChosen) {
                    refresher.toggle()
                    print(presetChosen)
                }
                TariffSettingView()
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
