//
//  LoginView.swift
//  NTTTestiOS
//
//  Created by Jesus Ervin Chapi Suyo on 7/11/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
           //header here
            AuthHeaderView(title1: "Hola,", title2: "te estabamos esperando")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 textCase: .lowercase,
                                 keyboardType: .emailAddress,
                                 textContentType: .emailAddress,
                                 text: $email)
                
                
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 textCase: .lowercase,
                                 keyboardType: .default,
                                 textContentType: .password,
                                 isSecureField: true,
                                 text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("Camiar contrasenia")
                } label: {
                    Text("Olvidaste tu contrasenia?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.themeColor)
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            Button {
                print("Sign In")
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color.themeColor)
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            NavigationLink  {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("No tienes una cuenta?")
                        .font(.footnote)
                    
                    Text("Registrate")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color.themeColor)

        }
        .ignoresSafeArea()
        
         
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
