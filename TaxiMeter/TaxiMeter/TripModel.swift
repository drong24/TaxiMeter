//
//  Trip.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 10/26/24.
//

import Foundation
import CoreLocation

struct TripModel : Identifiable, Equatable {
    let id: UUID = UUID()
    let mileConverstionRate = 0.000621371
    let kilometerConversionRate = 0.001
    var dateTime = Date()
    var distance: Double
    var rate: Double
    var initialFee: Double
    
    mutating func setRate(newRate: Double) {
        rate = newRate
    }
    
    mutating func setInitialFee(newFee: Double) {
        initialFee = newFee
    }
    
    func getDistanceInMi() -> Double {
        return distance * mileConverstionRate
    }
    
    func getDistanceInKm() -> Double {
        return distance * kilometerConversionRate
    }
    
    func getTotalFare() -> Double {
        return distance * rate + initialFee
    }
    
}
