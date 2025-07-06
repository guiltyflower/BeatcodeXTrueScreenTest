//
//  ItemDetailView.swift
//  BeatcodeXTrueScreenTest
//
//  Created by Giovanni Fioretto on 05/07/25.
//

import SwiftUI

struct ItemDetailView: View {
    @Binding var item: Item
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 40) {
                //eventual other item things (image ecc ecc)
                Text("This is the description page for \(item.itemName)")
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, 150)
            
            //the button is floating to avoid hitting other objects in the view
            Button {
                item.isFavorite.toggle()
            } label: {
                Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(item.isFavorite ? .red : .gray)
                    .padding(12)
                    .background(
                        Circle()
                            .fill(Color(.white))
                            .shadow(radius: 2)
                    )
            }
            .accessibilityRemoveTraits(.isButton)
            .accessibilityHint(item.isFavorite ?
                               "Favorite icon. This is a favorite item. Double tap to remove from favorites"
                               : "Favorite icon, tap to add to favorites")
            .padding(.top, 16)
            .padding(.trailing, 16)
        }
        .navigationTitle(item.itemName.uppercased())
        .navigationBarTitleDisplayMode(.inline)
    }
}



#Preview {
    ItemDetailView(item: .constant(Item(itemName: "cat", isFavorite: true)))
}

