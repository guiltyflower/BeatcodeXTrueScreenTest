//
//  ContentView.swift
//  BeatcodeXTrueScreenTest
//
//  Created by Giovanni Fioretto on 04/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ItemsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach($viewModel.items) { $item in
                    
                    NavigationLink {
                        ItemDetailView(item: $item)
                    } label: {
                        HStack {
                            
                            Text(item.itemName)
                                .accessibilityLabel(item.itemName)
                                .accessibilityRemoveTraits(.isButton)
                            Spacer()
                            
                            Button {
                                item.isFavorite.toggle()
                            } label: {
                                Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                                    .foregroundColor(item.isFavorite ? .red : .gray)
                            }
                            .buttonStyle(PlainButtonStyle())
                            //I use this modifier to remove the click effect on the whole list item
                          
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityRemoveTraits(.isButton)
                        .accessibilityAdjustableAction { direction in
                            switch direction {
                            case .increment:
                                item.isFavorite.toggle()
                            default:
                                print("not handled")
                            }
                        }
                        .accessibilityHint("Double tap for the details, scroll up with one finger to add to favorite")
                    }
                    
                    
                }
            }
            .navigationTitle("Items")
        }
    }
}

#Preview {
    ContentView()
}
