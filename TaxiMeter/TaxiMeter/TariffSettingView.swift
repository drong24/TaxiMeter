//
//  TariffSettingView.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 11/16/24.
//

import SwiftUI

struct TariffSettingView: View {
    
    @StateObject var settingVM = SettingsViewModel()
    
    @State var tariff1 = UserDefaults.standard.stringArray(forKey: "tariff1") ?? ["1.0", "2.0", "3.0", "4.0", "5.0"]
    @State var tariff2 = UserDefaults.standard.stringArray(forKey: "tariff2") ?? ["2.0", "2.0", "3.0", "4.0", "5.0"]
    @State var tariff3 = UserDefaults.standard.stringArray(forKey: "tariff3") ?? ["3.0", "2.0", "3.0", "4.0", "5.0"]
    
    
    var body: some View {
        
        if settingVM.getPreset() == "1" {
            VStack {
                HStack {
                    Text("Tariff:")
                    Spacer()
                    TextField(tariff1[0], text: $tariff1[0])
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
                HStack {
                    Text("Fare Rate:")
                    Spacer()
                    TextField(tariff1[1], text: $tariff1[1])
                        .frame(width: 100, alignment: .trailing)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
                HStack {
                    Text("Initial Fee:")
                    Spacer()
                    TextField(tariff1[2], text: $tariff1[2])
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
                HStack {
                    Text("Tolls:")
                    Spacer()
                    TextField(tariff1[3], text: $tariff1[3])
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
                HStack {
                    Text("Wait Fee Rate:")
                    Spacer()
                    TextField(tariff1[4], text: $tariff1[4])
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
            }
            .onChange(of: tariff1) {
                settingVM.saveNewDefault(arrayName: "tariff", array: tariff1)
            }
        }
        else if settingVM.presetChosen == "2" {
            VStack {
                HStack {
                    Text("Tariff:")
                    Spacer()
                    TextField(tariff2[0], text: $tariff2[0])
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
                HStack {
                    Text("Fare Rate:")
                    Spacer()
                    TextField(tariff2[1], text: $tariff2[1])
                        .frame(width: 100, alignment: .trailing)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
                HStack {
                    Text("Initial Fee:")
                    Spacer()
                    TextField(tariff2[2], text: $tariff2[2])
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
                HStack {
                    Text("Tolls:")
                    Spacer()
                    TextField(tariff2[3], text: $tariff2[3])
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
                HStack {
                    Text("Wait Fee Rate:")
                    Spacer()
                    TextField(tariff2[4], text: $tariff1[4])
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
            }
            .onChange(of: tariff2) {
                settingVM.saveNewDefault(arrayName: "tariff", array: tariff1)
            }
        }
        else {
            VStack {
                HStack {
                    Text("Tariff:")
                    Spacer()
                    TextField(tariff3[0], text: $tariff3[0])
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
                HStack {
                    Text("Fare Rate:")
                    Spacer()
                    TextField(tariff3[1], text: $tariff3[1])
                        .frame(width: 100, alignment: .trailing)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
                HStack {
                    Text("Initial Fee:")
                    Spacer()
                    TextField(tariff3[2], text: $tariff3[2])
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
                HStack {
                    Text("Tolls:")
                    Spacer()
                    TextField(tariff3[3], text: $tariff3[3])
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
                HStack {
                    Text("Wait Fee Rate:")
                    Spacer()
                    TextField(tariff3[4], text: $tariff3[4])
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .padding(7)
                        .border(Color.gray)
                }
            }
            .onChange(of: tariff3) {
                settingVM.saveNewDefault(arrayName: "tariff", array: tariff1)
            }
        }
    }
}

#Preview {
    TariffSettingView()
}
