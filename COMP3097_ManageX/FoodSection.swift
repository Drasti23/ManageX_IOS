//
//  FoodSection.swift
//  ManageX
//
//  Created by Drasti Parikh on 2025-02-28.
//

import Foundation

struct FoodSection: Identifiable {
    let id: UUID
    var name: String
    var items: [FoodItem]

    init(id: UUID = UUID(), name: String, items: [FoodItem] = []) {
        self.id = id
        self.name = name
        self.items = items
    }
}

struct FoodItem: Identifiable {
    let id: UUID
    var name: String
    var price: Double

    init(id: UUID = UUID(), name: String, price: Double) {
        self.id = id
        self.name = name
        self.price = price
    }
}
