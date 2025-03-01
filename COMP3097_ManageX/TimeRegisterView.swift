//
//  TimeRegisterView.swift
//  COMP3097_ManageX
//
//  Created by Om Makwana on 2025-03-01.
//

import SwiftUI

struct TimeRegisterView: View {
    @State private var userID: String = ""
    @State private var password: String = ""
    @State private var isAuthenticated: Bool = false // To track authentication state
    @State private var errorMessage: String? = nil

    var body: some View {
        VStack {
            if isAuthenticated {
                TimeRegisterMainView() // Navigate to the main Time Registering page
            } else {
                VStack {
                    Text("Time Register Login")
                        .font(.headline)
                        .padding(.bottom, 20)

                    TextField("Enter User ID", text: $userID)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    SecureField("Enter Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    if let error = errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.bottom, 10)
                    }

                    Button(action: {
                        authenticateUser()
                    }) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        .padding()
        .navigationTitle("Time Register")
    }

    // Authentication logic
    func authenticateUser() {
        if userID == "23" && password == "2323" { // Replace with your actual authentication logic
            isAuthenticated = true
            errorMessage = nil
        } else {
            errorMessage = "Invalid User ID or Password"
        }
    }
}


#Preview {
    TimeRegisterView()
}
