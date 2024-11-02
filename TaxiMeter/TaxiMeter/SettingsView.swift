//
//  TripHistoryView.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 10/30/24.
//

import SwiftUI

struct SettingsView: View {
    @State var tarrif1 = ""
    @State var tarrif2 = ""
    @State var tarrif3 = ""
    
    var body: some View {
        List {
            Section("Tariffs") {
                HStack {
                    Text("Tariffs: ")
                    TextField("", text: $tarrif1)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                    Button("Delete", action: {
                        
                    })
                }
                Text("Tariff:")
                Text("Tariff:")
                
            }
            Section("Other Setings") {

                Text("Setting1")
                Text("Setting2")
                
            }
        }
    }
}

#Preview {
    SettingsView()
}
