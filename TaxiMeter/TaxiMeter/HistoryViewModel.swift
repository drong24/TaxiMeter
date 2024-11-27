//
//  HistoryViewModel.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 11/19/24.
//


import Foundation
import FirebaseCore
import FirebaseFirestore

class HistoryViewModel : ObservableObject {
    
//    @Published var trips = [
//    TripModel(distance: 0, rate: 0, initialFee: 0),
//    TripModel(distance: 1, rate: 1.00, initialFee: 0),
//    TripModel(distance: 4, rate: 4.0, initialFee: 9.99),
//    TripModel(distance: 3.22, rate: 1.00, initialFee: 10.99)
//    ]
    
    @Published var trips = [TripModel]()
    let db = Firestore.firestore()
    
    func fetchData() {
        self.trips.removeAll()
        do {
            db.collection("trips").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.trips.append(try document.data(as: TripModel.self))
                        } catch {
                            print(error)
                        }
                    }
                    print(self.trips)
                }
            }
        }
    }
    
    func saveData(trip : TripModel) {

        db.collection("trips").addDocument(data: [
            "dateTime": trip.dateTime,
            "distance": trip.distance,
            "rate": trip.rate,
            "initialFee": trip.initialFee,
            "currency": trip.currency,
            "distanceUnit": trip.distanceUnit,
            "toll": trip.toll,
            "waitTimeFee": trip.waitTimeFee,
            "waitTimeRate": trip.waitTimeRate
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Sucessfully added document.")
            }
        }
        
    }
    
    func deleteData(trip : TripModel) {
        if let id = trip.id {
            db.collection("trips").document(id).delete()
            { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Sucessfully removed document.")
                }
            }
        }
    }
}
