//
//  SignManager.swift
//  FirebaseAuthDemo
//
//  Created by Berkay on 12.01.2025.
//


import SwiftUI
import FirebaseAuth

class SignManager: ObservableObject {
    @Published var signStatus = false
    func signUp(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error during sign-up: \(error.localizedDescription)")
                completion(.failure(error))
            } else if let user = authResult?.user {
                completion(.success("User signed up: \(user.email ?? "unknown email")"))
            }
        }
    }

    
    func signIn(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error during sign-in: \(error.localizedDescription)")
                completion(.failure(error))
            } else if let user = authResult?.user {
                completion(.success("User signed in: \(user.email ?? "No Email")"))
                self.signStatus = true
            }
        }
    }

    
    func signOut(completion: @escaping (Result<Bool, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            print("User signed out successfully.")
            completion(.success(true)) // Indicate success
        } catch let signOutError {
            print("Error signing out: \(signOutError.localizedDescription)")
            completion(.failure(signOutError)) // Pass the error to the completion handler
        }
    }

}
