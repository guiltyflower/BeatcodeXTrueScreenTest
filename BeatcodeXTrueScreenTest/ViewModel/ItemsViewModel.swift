//
//  ItemsViewModel.swift
//  BeatcodeXTrueScreenTest
//
//  Created by Giovanni Fioretto on 05/07/25.
//

import Foundation

class ItemsViewModel: ObservableObject {
    @Published var items: [Item]//published var to update the favourite status ion both views
    
    init() {
        self.items = [
            Item(itemName: "Item 1"),
            Item(itemName: "Item 2"),
            Item(itemName: "Item 3"),
            Item(itemName: "Item 4"),
            Item(itemName: "Item 5"),
            Item(itemName: "Item 6"),
            Item(itemName: "Item 7")
        ]
    }
    //list of 7 elements. 7 because is the maximum number of everything (cit.)
}
