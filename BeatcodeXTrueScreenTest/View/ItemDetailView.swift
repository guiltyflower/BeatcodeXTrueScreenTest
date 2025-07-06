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
        VStack{
            Text(item.itemName)
                .accessibilityLabel(item.itemName)
            Button {
                item.isFavorite.toggle()
            } label: {
                Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(item.isFavorite ? .red : .gray)
            }
            
        }
    }
}



#Preview {
    ItemDetailView(item: .constant(Item(itemName: "cat", isFavorite: true)))
}

