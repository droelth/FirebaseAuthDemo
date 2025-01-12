//
//  ContentView.swift
//  FirebaseAuthDemo
//
//  Created by Berkay on 12.01.2025.
//

import SwiftUI

struct ContentView: View {
    @State var title: titleName = .signIn
    @State var signBarStatus: SignButtonActive = .signIn
    
    @State var email = ""
    @State var pass = ""
    @State var textValue = ""
    @State var signStatus = false
    var body: some View {
        NavigationStack {
            
            HStack{
                Button {
                    signBarStatus = .signIn
                    title = .signIn
                    
                    
                } label: {
                    Text("Login").bold().frame(maxWidth: .infinity).padding(.vertical).background(signBarStatus == .signIn ? .green : .white)
                }
                Spacer()
                Button {
                    signBarStatus = .signUp
                    title = .signUp
                    
                } label: {
                    Text("Sign-Up").bold().bold().frame(maxWidth: .infinity).padding(.vertical).background(signBarStatus == .signUp ? .green : .white)
                }
                
            }.padding(.horizontal,10).frame(maxWidth: .infinity).padding(.vertical).background(.blue)
            
            Divider()
            if signBarStatus == .signIn {
                LogInView(email: $email, pass: $pass, textValue: $textValue).navigationTitle(title.rawValue)
            } else {
                SignUpView(email: $email, pass: $pass, textValue: $textValue).navigationTitle(title.rawValue)
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}



