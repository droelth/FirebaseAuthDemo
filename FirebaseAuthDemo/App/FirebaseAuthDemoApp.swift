//
//  FirebaseAuthDemoApp.swift
//  FirebaseAuthDemo
//
//  Created by Berkay on 12.01.2025.
//

import SwiftUI
import Firebase

@main
struct FirebaseAuthDemoApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
