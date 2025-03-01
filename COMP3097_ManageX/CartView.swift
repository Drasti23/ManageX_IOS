//
//  CartView.swift
//  ManageX
//
//  Created by Drasti Parikh on 2025-02-28.
//

import SwiftUI

struct CartView: View {
    @Binding var cartItems: [CartItem]
    
    var body: some View {
        VStack {
            List {
                ForEach(cartItems) { item in
                    HStack {
                        Text(item.product.name)
                        Spacer()
                        Text("$\(item.product.price, specifier: "%.2f") x \(item.quantity)")
                        Text("$\(item.total, specifier: "%.2f")")
                    }
                }
                .onDelete(perform: deleteItem)
            }
            
            Text("Total: $\(cartItems.reduce(0) { $0 + $1.total }, specifier: "%.2f")")
                .font(.title)
                .padding()
            
            NavigationLink(destination: CheckoutView(cartItems: $cartItems)) {
                Text("Proceed to Checkout")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
            }
            .padding()
        }
        .navigationTitle("Your Cart")
    }
    
    func deleteItem(at offsets: IndexSet) {
        cartItems.remove(atOffsets: offsets)
    }
}

#Preview {
    CartView(cartItems: .constant([
        CartItem(id: "1", product: Product(id: "1", name: "Pizza", price: 10.0), quantity: 2)
    ]))
}

