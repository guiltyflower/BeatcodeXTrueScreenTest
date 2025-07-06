//
//  ContentView.swift
//  BeatcodeXTrueScreenTest
//
//  Created by Giovanni Fioretto on 04/07/25.
//

import SwiftUI
import UIKit

struct ItemListView: View {
    @StateObject private var viewModel = ItemsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach($viewModel.items) { $item in
                    
                    ItemCellView(item: $item)
                    
                }
            }
            .navigationTitle("Item List")
        }
    }
}

#Preview {
    ItemListView()
}
