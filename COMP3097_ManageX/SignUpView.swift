//
//  SignUpView.swift
//  ManageX
//
//  Created by Drasti Parikh on 2025-02-28.
//

//
//  SignUpView.swift
//

import SwiftUI


struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var restaurantName = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)

                // Restaurant Name Field
                TextField("Restaurant Name", text: $restaurantName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.words)

                // Email Field
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                // Password Field
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                // Confirm Password Field
                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                // Sign Up Button
                Button(action: {
                    // Add Sign Up Logic Here
                    print("User signed up with email: \(email), restaurant: \(restaurantName)")
                }) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.top, 20)

                // Link to Sign In Page
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(.gray)
                    NavigationLink(destination: SignInView()) {
                        Text("Sign In")
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.top, 20)

                Spacer()
            }
            .padding()
            .navigationTitle("Create Account")
        }
    }
}

#Preview {
    SignUpView()
}
