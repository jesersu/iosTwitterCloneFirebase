//
//  TwitterCloneSwiftUIApp.swift
//  TwitterCloneSwiftUI
//
//  Created by Jesus Chapi on 03/11/23.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneSwiftUIApp: App {

    @StateObject var viewModel = AuthViewModel()
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
             }
            .environmentObject(viewModel)
        }
    }
}
