import SwiftUI

struct ManagePOSView: View {
    @State private var foodSections: [FoodSection] = [
        FoodSection(id: UUID(), name: "Food", items: []),
        FoodSection(id: UUID(), name: "Drinks", items: []) // Pre-populate with Food and Drinks sections
    ]
    @State private var showAddSection: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                if foodSections.isEmpty {
                    Text("No Food Sections Available")
                        .foregroundColor(.gray)
                        .font(.title2)
                        .padding()
                } else {
                    List {
                        ForEach(foodSections) { section in
                            NavigationLink(destination: SectionDetailView(sectionId: section.id, foodSections: $foodSections)) {
                                Text(section.name)
                                    .font(.headline)
                            }
                        }
                    }
                }

                Button(action: {
                    showAddSection.toggle()
                }) {
                    Label("Add Food Section", systemImage: "plus.circle")
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding()
                }
                .sheet(isPresented: $showAddSection) {
                    NavigationView {
                        AddSectionView(foodSections: $foodSections) {
                            showAddSection = false // Close the sheet after adding
                        }
                    }
                }
            }
            .navigationTitle("Manage POS")
        }
    }
}

#Preview {
    ManagePOSView()
}
