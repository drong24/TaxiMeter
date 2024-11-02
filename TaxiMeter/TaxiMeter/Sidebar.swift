//
//  Sidebar.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 10/31/24.
//

import SwiftUI

struct Sidebar: View {
    
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            NavigationView {
                Text("A")
                Text("A")
            }
        } detail: {
            ContentView()
        }
    }
}

#Preview {
    Sidebar()
}
