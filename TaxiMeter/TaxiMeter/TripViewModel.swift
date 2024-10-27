//
//  TripViewModel.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 10/26/24.
//

import Foundation
import CoreLocation

class TripViewModel : ObservableObject {
    
    var locationManager = CLLocationManager()
    @Published private(set) var TripList = [TripModel]()
    
    var trip: TripModel = TripModel()
    

    func start() {
        
    }
    
    func stop() {
        
    }
    
    func reset() {
        
    }
    
    func saveTrip() {
        
    }
    
}
