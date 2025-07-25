//
//  ItemCellView.swift
//  BeatcodeXTrueScreenTest
//
//  Created by Giovanni Fioretto on 06/07/25.
//

import SwiftUI

struct ItemCellView: View {
    @Binding var item: Item
    
    var body: some View {
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
        
        .accessibilityHint(item.isFavorite ?
                           "This is a favorite item. Double tap to access the details page"
                           : "Double tap to access the details page")
        .accessibilityRemoveTraits(.isButton)
        .accessibilityAction(named: Text(item.isFavorite
                                         ? "Remove from favorites"
                                         : "Add to favorites")
        ) {
            item.isFavorite.toggle()
            let message = item.isFavorite
            ? "\(item.itemName) added to favorites"
            : "\(item.itemName) Removed from favorites"
            UIAccessibility.post(notification: .announcement, argument: message)
        }
        .accessibilityAction(named: Text("Spell item name")) {
            let spelled = item.itemName.map { String($0) }.joined(separator: " ")
            UIAccessibility.post(notification: .announcement, argument: spelled)
        }
        //putting the accessibility action I removed the spelling action (swipe down, so I've done it again in case of needing it, even if it's faster
    }
}

#Preview {
    NavigationStack {
        ItemCellView(item: .constant(Item(itemName: "Sample Item", isFavorite: false)))
            .padding()
    }
}
