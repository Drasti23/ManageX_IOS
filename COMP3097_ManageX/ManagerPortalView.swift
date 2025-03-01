//
//  ManagerPortalView.swift
//  ManageX
//
//  Created by Drasti Parikh on 2025-02-28.
//

import SwiftUI

struct ManagerPortalView: View {
    @State private var managerId: String = ""
    @State private var managerPassword: String = ""
    @State private var isAuthenticated = false

    var body: some View {
        VStack {
            if isAuthenticated {
                // Display Manager Portal options after authentication
                VStack(alignment: .leading, spacing: 20) {
                    Text("Welcome, Manager!")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .padding(.leading, 20)

                    // Manager Portal Options
                    VStack(spacing: 20) {
                        NavigationLink(destination: ManagePOSView()) {
                            ManagerPortalButton(title: "Manage POS", systemImage: "cart.fill")
                        }

                        NavigationLink(destination: ManageEmployeeView()) {
                            ManagerPortalButton(title: "Manage Employee", systemImage: "person.3.fill")
                        }

                        NavigationLink(destination: SettingsView()) {
                            ManagerPortalButton(title: "Settings", systemImage: "gearshape.fill")
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20) // Adds a bit of space between Welcome and the options
                }
                .frame(maxWidth: .infinity, alignment: .top)
                .padding(.top, 50) // Padding to shift content away from the top edge
            } else {
                // Display authentication form
                Text("Manager Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 50)

                // Manager ID Text Field
                TextField("Enter Manager ID", text: $managerId)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .frame(maxWidth: 300)

                // Manager Password Secure Field
                SecureField("Enter Password", text: $managerPassword)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .frame(maxWidth: 300)

                // Login Button
                Button(action: {
                    if managerId == "12" && managerPassword == "1234" {
                        isAuthenticated = true
                    } else {
                        // Add a simple alert or error message here if credentials are incorrect
                        print("Invalid credentials")
                    }
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.top, 20)
                        .frame(maxWidth: 300)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

struct ManagerPortalButton: View {
    let title: String
    let systemImage: String

    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .foregroundColor(.white)
                .font(.title)
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

#Preview {
    ManagerPortalView()
}
