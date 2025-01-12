//
//  SignInView.swift
//  FirebaseAuthDemo
//
//  Created by Berkay on 12.01.2025.
//


import SwiftUI

struct SignUpView: View {
    @Binding var email: String
    @Binding var pass: String
    @Binding var textValue: String
    
    @StateObject var sm = SignManager()
    
    var body: some View {
        VStack {
            TextField("email", text: $email)
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(5)
                .padding()
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            SecureField("pass", text: $pass)
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(5)
                .padding()
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            Button {
                sm.signUp(email: email, password: pass) { result in
                    switch result {
                    case .success( _):
                        textValue = "\(email) has signed in!"
                    case .failure(let error):
                        print("Sign-up failed: \(error.localizedDescription)")
                    }
                }
            } label: {
                Text("Sign-up").bold().fontWeight(.medium).padding().background(.blue).cornerRadius(5).foregroundStyle(.white)
            }
            
            Text(textValue).foregroundStyle(.blue).fontWeight(.black)
            Button {
                //
            } label: {
                Text("").bold().fontWeight(.light).padding()
            }
        }
    }
}



import FirebaseAuth

