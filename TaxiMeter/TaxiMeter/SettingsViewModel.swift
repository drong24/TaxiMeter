//
//  SettingsViewModel.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 11/17/24.
//

import Foundation


class SettingsViewModel : ObservableObject {
     
    var presetChosen = UserDefaults.standard.string(forKey: "presetChosen") ?? "1"
    var tariff1 = UserDefaults.standard.stringArray(forKey: "tariff1") ?? [String]()
    var tariff2 = UserDefaults.standard.stringArray(forKey: "tariff2") ?? ["2.0", "2.0", "3.0", "4.0", "5.0"]
    var tariff3 = UserDefaults.standard.stringArray(forKey: "tariff3") ?? ["3.0", "2.0", "3.0", "4.0", "5.0"]
    
    func getPreset() -> String {
        return presetChosen
    }
    func getTariff() -> String {
        if (presetChosen == "1") {
            return tariff1[0]
        }
        else if (presetChosen == "2") {
            return tariff2[0]
        }
        return tariff3[0]
    }
    func getFareRate() -> String {
        if (presetChosen == "1") {
            return tariff1[1]
        }
        else if (presetChosen == "2") {
            return tariff2[1]
        }
        return tariff3[1]
    }
    func getInitialFee() -> String {
        if (presetChosen == "1") {
            return tariff1[2]
        }
        else if (presetChosen == "2") {
            return tariff2[2]
        }
        return tariff3[2]
    }
    func getTolls() -> String {
        if (presetChosen == "1") {
            return tariff1[3]
        }
        else if (presetChosen == "2") {
            return tariff2[3]
        }
        return tariff3[3]
    }
    func getWaitFeeRate() -> String {
        if (presetChosen == "1") {
            return tariff1[4]
        }
        else if (presetChosen == "2") {
            return tariff2[4]
        }
        return tariff3[4]
    }
    func saveNewDefault(arrayName: String, array : [String]) {
        UserDefaults.standard.setValue(array, forKey: arrayName)
    }
    
}
