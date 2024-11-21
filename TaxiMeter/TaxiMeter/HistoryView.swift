//
//  HistoryView.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 11/19/24.
//

import SwiftUI

struct HistoryView: View {
    
    @ObservedObject var tripApp = HistoryViewModel()
    @State var trip = TripModel(distance: 0, rate: 0, initialFee: 0)
    @State var refresher: Bool = false
    
    var body: some View {
        Text("History")
            .font(.title)
            .bold()
        ScrollView {
            VStack {
                ForEach(tripApp.trips) { trip in
                    VStack {
                        Text("\(trip.dateTime.formatted())")
                            .font(.headline)
                        Text("Distance: \(String(trip.distance))")
                        Text("Rate: \(String(trip.rate))")
                        Text("Initial Fee: \(String(trip.initialFee))")
                        Text("Total Fare: \(String(trip.getTotalFare()))")
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .border(Color.black)
                }
            }
            .padding()
        }
    }
}

#Preview {
    HistoryView()
}
