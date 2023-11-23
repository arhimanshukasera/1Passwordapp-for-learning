//
//  LoginscreenUI.swift
//  1Password
//
//  Created by Himanshu Kasera on 22/11/23.
//

import SwiftUI

struct LoginscreenUI: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    
    var body: some View {
        
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            Circle()
                .foregroundColor(.white.opacity(0.15))
                .aspectRatio(1, contentMode: .fit)
            
            Circle()
                .foregroundColor(.white.opacity(0.15))
                .aspectRatio(0.9, contentMode: .fit)
            
            Circle()
                .foregroundColor(.white.opacity(0.15))
                .aspectRatio(0.8, contentMode: .fit)
            
            
            Circle()
                .foregroundColor(.white.opacity(0.15))
                .aspectRatio(0.7, contentMode: .fit)
            
            
            Circle()
                .foregroundColor(.white.opacity(0.15))
                .aspectRatio(0.6, contentMode: .fit)
            
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Username", text: $username)
                    .padding()
                    .frame(width: 350, height: 60)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongUsername))
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 350, height: 60)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongPassword ))
                
                Button("Login") {
                    //
                }
                .foregroundColor(.white)
                .frame(width: 350, height: 60)
                .background(Color.blue)
                .cornerRadius(10)
                .navigationBarHidden(true)
                
               
            }
            
        }
        
        
    }
    
    func authenticateUser(Username: String, Password: String) {
        if username.lowercased() == "Mario123" {
            wrongUsername = 0
            if password.lowercased() == "Abc123" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
                wrongUsername = 2
            }
        }
        
        
    }
}

#Preview {
    LoginscreenUI()
}

