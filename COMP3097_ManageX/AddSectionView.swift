//
//  AddSectionView.swift
//  ManageX
//
//  Created by Drasti Parikh on 2025-02-28.
//


import SwiftUI

struct AddSectionView: View {
    @Binding var foodSections: [FoodSection] // Reference to the list of food sections
    @State private var sectionName: String = ""
    var onSectionAdded: (() -> Void)? // Callback when a section is added

    var body: some View {
        VStack {
            TextField("Enter Food Section Name", text: $sectionName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                if !sectionName.isEmpty {
                    // Add the new section
                    let newSection = FoodSection(name: sectionName, items: [])
                    foodSections.append(newSection)

                    // Trigger the callback to inform ManagePOSView
                    onSectionAdded?()
                }
            }) {
                Text("Add Section")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
        .navigationTitle("Add Food Section")
    }
}
