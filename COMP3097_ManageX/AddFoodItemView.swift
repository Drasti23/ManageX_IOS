//
//  AddFoodItemView.swift
//  ManageX
//
//  Created by Drasti Parikh on 2025-02-28.
//

import SwiftUI

struct AddFoodItemView: View {
    var section: FoodSection
    @Binding var foodSections: [FoodSection]
    @State private var itemName: String = ""
    @State private var itemPrice: String = ""
    @Environment(\.presentationMode) var presentationMode
    var itemToEdit: FoodItem? // Optional item to edit

    init(section: FoodSection, foodSections: Binding<[FoodSection]>, itemToEdit: FoodItem? = nil) {
        self.section = section
        self._foodSections = foodSections
        self.itemToEdit = itemToEdit

        // Pre-fill fields if editing an item
        if let item = itemToEdit {
            _itemName = State(initialValue: item.name)
            _itemPrice = State(initialValue: String(item.price))
        }
    }

    var body: some View {
        VStack {
            Text("Add Item to \(section.name)")
                .font(.largeTitle)
                .padding()

            List {
                ForEach(section.items) { item in
                    HStack {
                        Text(item.name)
                            .font(.subheadline)
                        Spacer()
                        Text(String(format: "$%.2f", item.price))
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                }
            }

            VStack {
                TextField("Item Name", text: $itemName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Price ($)", text: $itemPrice)
                    .keyboardType(.decimalPad)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                    if let price = Double(itemPrice), !itemName.isEmpty {
                        if let editItem = itemToEdit, let index = section.items.firstIndex(where: { $0.id == editItem.id }) {
                            // Edit existing item
                            if let sectionIndex = foodSections.firstIndex(where: { $0.id == section.id }) {
                                foodSections[sectionIndex].items[index] = FoodItem(id: editItem.id, name: itemName, price: price)
                            }
                        } else {
                            // Add new item
                            let newItem = FoodItem(id: UUID(), name: itemName, price: price)
                            if let sectionIndex = foodSections.firstIndex(where: { $0.id == section.id }) {
                                foodSections[sectionIndex].items.append(newItem)
                            }
                        }
                        print("Updated foodSections after adding/editing item: \(foodSections)")
                        itemName = "" // Reset fields
                        itemPrice = ""
                        presentationMode.wrappedValue.dismiss() // Dismiss the view after adding/editing
                    }
                }) {
                    Text(itemToEdit != nil ? "Update Item" : "Add Food Item")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .navigationTitle("Add Food Item")
    }
}
