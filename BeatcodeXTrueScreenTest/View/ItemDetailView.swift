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
        VStack(spacing: 40){
            
            Text(item.itemName)
                .textCase(.uppercase)
                .font(.title)
                .fontWeight(.bold)
                .accessibilityLabel(item.itemName)
            
            Text("This is the description page for \(item.itemName)")
          
            Button {
                item.isFavorite.toggle()
            } label: {
                Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(item.isFavorite ? .red : .gray)
            }
            
     
           
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
        .padding(.top, 40)
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
     
    }
}



#Preview {
    ItemDetailView(item: .constant(Item(itemName: "cat", isFavorite: true)))
}

