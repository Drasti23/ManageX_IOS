//
//  POSView.swift
//  ManageX
//
//  Created by Drasti Parikh on 2025-02-28.
//
import SwiftUI

struct POSView: View {
    @State private var cartItems: [CartItem] = []
    @State private var selectedSection: String = "Pizza" // Default section
    
    // Sample data for each section
    let pizzaItems = [
        Product(id: "1", name: "Margherita", price: 10.0),
        Product(id: "2", name: "Pepperoni", price: 12.0)
    ]
    
    let burgerItems = [
        Product(id: "3", name: "Cheeseburger", price: 8.0),
        Product(id: "4", name: "Veggie Burger", price: 7.0)
    ]
    
    let pastaItems = [
        Product(id: "5", name: "Spaghetti", price: 9.0),
        Product(id: "6", name: "Penne Alfredo", price: 11.0)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Top Navigation Bar (Tabs)
                Picker("Select Food Section", selection: $selectedSection) {
                    Text("Pizza").tag("Pizza")
                    Text("Burgers").tag("Burgers")
                    Text("Pasta").tag("Pasta")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // Display Food Items for Selected Section
                ScrollView {
                    VStack {
                        SectionTitleView(section: selectedSection)

                        let products = getProducts(for: selectedSection)
                        
                        ForEach(products) { product in
                            ProductRow(product: product, addToCart: addToCart)
                        }
                    }
                }
                
                // Cart Section
                VStack {
                    Text("Total: $\(cartItems.reduce(0) { $0 + $1.total }, specifier: "%.2f")")
                        .font(.title)
                        .padding()

                    NavigationLink(destination: CartView(cartItems: $cartItems)) {
                        Text("Go to Cart")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity)
                    }
                    .padding()
                }
            }
            .navigationTitle("POS")
        }
    }
    
    // Get products for selected section
    func getProducts(for section: String) -> [Product] {
        switch section {
        case "Pizza":
            return pizzaItems
        case "Burgers":
            return burgerItems
        case "Pasta":
            return pastaItems
        default:
            return []
        }
    }
    
    // Add product to cart
    func addToCart(product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            let newItem = CartItem(id: UUID().uuidString, product: product, quantity: 1)
            cartItems.append(newItem)
        }
    }
}

// Custom View for Product Row
struct ProductRow: View {
    var product: Product
    var addToCart: (Product) -> Void

    var body: some View {
        HStack {
            Text(product.name)
                .font(.headline)
            Spacer()
            Text("$\(product.price, specifier: "%.2f")")
            Button(action: {
                addToCart(product)
            }) {
                Text("Add to Cart")
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

// Custom View for Section Title
struct SectionTitleView: View {
    var section: String

    var body: some View {
        Text("\(section) Menu")
            .font(.title)
            .fontWeight(.bold)
            .padding(.top, 20)
    }
}



#Preview {
    POSView()
}
