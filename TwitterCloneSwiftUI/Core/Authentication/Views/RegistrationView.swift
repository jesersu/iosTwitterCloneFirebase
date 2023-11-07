//
//  RegistrationView.swift
//  NTTTestiOS
//
//  Created by Jesus Ervin Chapi Suyo on 7/11/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var nombre = ""
    @State private var apellido = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            
            AuthHeaderView(title1: "Get started,", title2: "Create your account")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 textCase: .lowercase,
                                 keyboardType: .emailAddress,
                                 textContentType: .emailAddress,
                                 text: $email)
                
                CustomInputField(imageName: "person",
                                 placeholderText: "Nombre",
                                 textCase: .lowercase,
                                 keyboardType: .default,
                                 textContentType: .name,
                                 text: $nombre)
                
                CustomInputField(imageName: "person",
                                 placeholderText: "Apellido",
                                 textContentType: .name,
                                 textInputAutoCapital: .words,
                                 text: $apellido)
                
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 textContentType: .newPassword,
                                 isSecureField: true,
                                 text: $password)
            }
            .padding(32)
            
            Button {
                print("Sign Up")
                viewModel.register(withEmail: email,
                                   password: password,
                                   apellido: apellido,
                                   nombre: nombre)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color.themeColor)
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("ya tienes una cuenta?")
                        .font(.footnote)
                    
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
        }
        .ignoresSafeArea()
    }
}
