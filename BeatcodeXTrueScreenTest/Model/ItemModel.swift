//
//  ItemModel.swift
//  BeatcodeXTrueScreenTest
//
//  Created by Giovanni Fioretto on 04/07/25.
//

import Foundation
import SwiftUI


struct Item: Identifiable {
    let id = UUID()
    let itemName: String
    let itemImage: String
    var isFavorite: Bool = false
}
