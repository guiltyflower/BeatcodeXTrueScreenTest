//
//  ContentView.swift
//  BeatcodeXTrueScreenTest
//
//  Created by Giovanni Fioretto on 04/07/25.
//

import SwiftUI
import UIKit

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
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityHint("Double tap for the details")
                    .accessibilityAction(named: Text(item.isFavorite
                                                     ? "Remove from favorites"
                                                     : "Add to favorites")
                    ) {
                        item.isFavorite.toggle()
                    }
                    .accessibilityAction(named: Text("Spell item name")) {
                        let spelled = item.itemName.map { String($0) }.joined(separator: " ")
                        UIAccessibility.post(notification: .announcement, argument: spelled)
                    }
                    //putting the accessibility action I removed the spelling action (swipe down, so I've done it again in case of needing it, even if it's faster
                    
                }
            }
            .navigationTitle("Items")
        }
    }
}

#Preview {
    ContentView()
}
