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
    
    @Published var trips = [
    TripModel(distance: 0, rate: 0, initialFee: 0),
    TripModel(distance: 1, rate: 1.00, initialFee: 0),
    TripModel(distance: 4, rate: 4.0, initialFee: 9.99),
    TripModel(distance: 3.22, rate: 1.00, initialFee: 10.99)
    ]
    
//    @Published var memos = [MemoModel]()
//    let db = Firestore.firestore()
//    
//    func fetchData() {
//        self.memos.removeAll()
//        do {
//            db.collection("memos").getDocuments() { (querySnapshot, err) in
//                if let err = err {
//                    print("Error getting documents: \(err)")
//                } else {
//                    for document in querySnapshot!.documents {
//                        do {
//                            self.memos.append(try document.data(as: MemoModel.self))
//                        } catch {
//                            print(error)
//                        }
//                    }
//                    print(self.memos)
//                }
//            }
//        }
//    }
//    
//    func saveData(memo : MemoModel) {
//        
//        if let id = memo.id {
//            if !memo.title.isEmpty || !memo.content.isEmpty {
//                let docRef = db.collection("memos").document(id)
//                
//                docRef.updateData([
//                    "title": memo.title,
//                    "content": memo.content,
//                    "timeDue": memo.timeDue
//                ]) { err in
//                    if let err = err {
//                        print("Error updating document: \(err)")
//                    } else {
//                        print("Sucessfully updated document.")
//                    }
//                }
//            }
//        } else {
//            if !memo.title.isEmpty || !memo.content.isEmpty {
//                db.collection("memos").addDocument(data: [
//                    "title": memo.title,
//                    "content": memo.content,
//                    "timeDue": memo.timeDue
//                ]) { err in
//                    if let err = err {
//                        print("Error adding document: \(err)")
//                    } else {
//                        print("Sucessfully added document.")
//                    }
//                }
//            }
//        }
//    }
//    
//    func deleteData(memo : MemoModel) {
//        if let id = memo.id {
//            db.collection("memos").document(id).delete()
//            { err in
//                if let err = err {
//                    print("Error adding document: \(err)")
//                } else {
//                    print("Sucessfully added document.")
//                }
//            }
//        }
//    }
}
