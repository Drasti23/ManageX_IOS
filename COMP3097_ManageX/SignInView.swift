import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showSignUp = false
    @State private var showError = false
    @State private var errorMessage = ""
    @State private var isLoggedIn = false // Track login status

    // Default credentials for signing in
    private let defaultEmail = "drastiparikh23@gmail.com"
    private let defaultPassword = "dp123456"

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Sign In")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                // Email Text Field
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                // Password Secure Field
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                // Error Message (if credentials don't match)
                if showError {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }

                // Sign In Button
                Button(action: {
                    signIn()
                }) {
                    Text("Sign In")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                // Sign Up Navigation Link
                Button(action: {
                    showSignUp.toggle()
                }) {
                    Text("Don't have an account? Sign Up")
                        .foregroundColor(.blue)
                }
                .sheet(isPresented: $showSignUp) {
                    SignUpView()
                }

                // Optional: Social Sign-In Buttons
                HStack {
                    Button(action: {
                        print("Sign in with Apple tapped")
                    }) {
                        Label("Sign in with Apple", systemImage: "applelogo")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    Button(action: {
                        print("Sign in with Google tapped")
                    }) {
                        Label("Sign in with Google", systemImage: "globe")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
            .padding()
            .background(
                NavigationLink(destination: HomePageView(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                .hidden() // Hide the navigation link, just use its functionality
            )
        }
    }

    // Sign In Logic
    func signIn() {
        if email == defaultEmail && password == defaultPassword {
            // If credentials are correct, navigate to Home Page
            isLoggedIn = true
        } else {
            // If credentials are incorrect, show an error message
            showError = true
            errorMessage = "Invalid email or password. Please try again."
        }
    }
}

#Preview {
    SignInView()
}
