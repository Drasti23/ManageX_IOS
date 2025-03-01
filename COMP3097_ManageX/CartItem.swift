//
//  CartItem.swift
//  ManageX
//
//  Created by Drasti Parikh on 2025-02-28.
//

import Foundation

struct CartItem: Identifiable {
    var id: String
    var product: Product
    var quantity: Int
    var total: Double {
        return product.price * Double(quantity)
    }
}

