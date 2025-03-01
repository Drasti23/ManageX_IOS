//
//  SplashScreenView.swift
//  ManageX
//
//  Created by Drasti Parikh on 2025-02-28.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        NavigationView { // Wrap the view in a NavigationView for seamless navigation
            if isActive {
                SignInView() // Navigate to SignInView after splash
            } else {
                VStack {
                    Image(systemName: "cart.fill") // Replace with your app logo
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)

                    Text("ManageX")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.top, 16)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true) // Hide the navigation bar on the splash screen
    }
}

#Preview {
    SplashScreenView()
}



