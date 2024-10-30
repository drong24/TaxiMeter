//
//  TripViewModel.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 10/26/24.
//

import Foundation
import CoreLocation


 
 class TripViewModel : ObservableObject {
     
     @Published private(set) var TripList = [TripModel]()
     
     func saveTrip(trip: TripModel) {
         TripList.append(trip)
         print(TripList)
     }
     
     func deleteTrip(trip: TripModel) {
         if let index = TripList.firstIndex(of: trip){
             TripList.remove(at: index)
             print(TripList)
         }
     }
     
 }

 
