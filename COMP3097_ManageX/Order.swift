//
//  Order.swift
//  ManageX
//
//  Created by Drasti Parikh on 2025-02-28.
//

import Foundation

struct Order {
    var id: String
    var items: [CartItem]
    var totalAmount: Double {
        return items.reduce(0) { $0 + $1.total }
    }
    var paymentMethod: String
}

