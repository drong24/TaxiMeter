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
        HStack {
            Text("History")
                .font(.title)
                .bold()
                .frame(alignment: .center)
            Spacer()
            Button {

            } label: {
                HStack {
                    Text("Clear History")
                    Image(systemName: "trash")
                }
                .padding(7)
                .overlay(
                    RoundedRectangle(cornerRadius: 7.0)
                        .stroke()
                )
            }
        }
        .padding(.horizontal)
        Divider()
            .overlay(.black)
        ScrollView {
            VStack {
                ForEach(tripApp.trips) { trip in
                    VStack(alignment: .leading) {
                        Text("\(trip.dateTime.formatted())")
                            .font(.system(size: 23))
                            .fontWeight(.bold)
                        HStack {
                            Text("Distance:")
                            Spacer()
                            Text("\(String(format: "%.2f", trip.distance)) \(trip.distanceUnit)")
                        }
                        HStack {
                            Text("Rate:")
                            Spacer()
                            Text(String(trip.rate))
                        }
                        HStack {
                            Text("Initial Fee:")
                            Spacer()
                            Text("\(String(trip.initialFee.formatted(.currency(code: trip.currency))))")
                        }
                        HStack {
                            Text("Toll:")
                            Spacer()
                            Text("\(String(trip.toll.formatted(.currency(code: trip.currency))))")
                        }
                        HStack {
                            Text("Wait Time Rate:")
                            Spacer()
                            Text("\(String(trip.waitTimeRate))")
                        }
                        HStack {
                            Text("Wait Time Fee:")
                            Spacer()
                            Text("\(String(trip.waitTimeFee.formatted(.currency(code: trip.currency))))")
                        }
                        Divider()
                        HStack {
                            Text("Total Fare:")
                            Spacer()
                            Text("\(String(trip.getTotalFare().formatted(.currency(code: trip.currency))))")
                        }
                        .font(.system(size: 26))
                        .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .border(Color.black)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    HistoryView()
}
