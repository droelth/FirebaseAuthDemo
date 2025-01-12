//
//  SignUpView.swift
//  FirebaseAuthDemo
//
//  Created by Berkay on 12.01.2025.
//


import SwiftUI
import FirebaseAuth

struct LogInView: View {
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
                sm.signIn(email: email, password: pass) { result in
                    switch result {
                    case .success( _):
                        textValue = "\(email) has logged in!"
                    case .failure(let error):
                        print("Sign-in failed: \(error.localizedDescription)")
                    }
                }

            } label: {
                Text("Login").bold().fontWeight(.medium).padding().background(.blue).cornerRadius(5).foregroundStyle(.white)
            }
        
            Text(textValue).foregroundStyle(.blue).fontWeight(.black).padding(.vertical,20)
           
            Button {
                sm.signOut { result in
                    switch result {
                    case .success:
                        print("Sign-out successful.")
                        // Update UI or perform other actions
                        textValue = "Sign-out successful."
                    case .failure(let error):
                        print("Sign-out failed: \(error.localizedDescription)")
                        // Handle the error
                    }
                }

            } label: {
                Text("Sign-Out").bold().fontWeight(.light).padding().background(.blue).cornerRadius(5).foregroundStyle(.white).disabled(sm.signStatus ? false : true)
            }
        }
    }
}
