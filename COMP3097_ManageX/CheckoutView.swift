//
//  CheckoutView.swift
//  ManageX
//
//  Created by Drasti Parikh on 2025-02-28.
//

import SwiftUI

struct CheckoutView: View {
    @Binding var cartItems: [CartItem]
    @State private var paymentMethod = "Cash"
    
    var body: some View {
        VStack {
            Text("Total: $\(cartItems.reduce(0) { $0 + $1.total }, specifier: "%.2f")")
                .font(.title)
                .padding()
            
            Picker("Payment Method", selection: $paymentMethod) {
                Text("Cash").tag("Cash")
                Text("Card").tag("Card")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Button(action: completeOrder) {
                Text("Complete Order")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
            }
            .padding()
        }
        .navigationTitle("Checkout")
    }
    
    func completeOrder() {
        let order = Order(id: UUID().uuidString, items: cartItems, paymentMethod: paymentMethod)
        // Process the order, such as saving to a database or notifying the backend
        print("Order completed: \(order)")
        
        // Reset cart after checkout
        cartItems = []
    }
}

#Preview {
    CheckoutView(cartItems: .constant([
        CartItem(id: "1", product: Product(id: "1", name: "Pizza", price: 10.0), quantity: 2)
    ]))
}

