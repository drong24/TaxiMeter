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
    @AppStorage("distanceUnit") var distanceUnit = "mi"
    @AppStorage("currenct") var currency = "USD"
    @AppStorage("appTheme") var appTheme = "Classic"
    
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
            }
            
            Section("Fare Calculations") {
                Picker(selection: $distanceUnit, label: Text("Km or Miles:")) {
                    Text("Km")
                    Text("Mi")
                }
                .pickerStyle(.menu)
                Picker(selection: $currency, label: Text("Currency:")) {
                    Text("USD")
                    Text("CAD")
                    Text("Yen")
                    Text("CYN")
                    Text("Peso")
                }
                .pickerStyle(.menu)
            }
            
            Section("Other Setings") {

                Picker(selection: $appTheme, label: Text("Color:")) {
                    Text("Classic")
                    Text("Classic Yellow")
                    Text("Classic White")
                    Text("Inverted")
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
