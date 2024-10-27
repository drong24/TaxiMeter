//
//  Trip.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 10/26/24.
//

import Foundation
import CoreLocation

struct TripModel : Identifiable {
    let id: UUID = UUID()
    let mileConverstionRate = 0.000621371
    let kilometerConversionRate = 0.001
    var prevLocation: CLLocation? = nil
    var currLocation: CLLocation? = nil
    var distance: Double = 0
    var rate: Double = 0.5
    var initialFee: Double = 10
    
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
