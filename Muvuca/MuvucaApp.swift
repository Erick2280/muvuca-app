//
//  MuvucaApp.swift
//  Muvuca
//
//  Created by Erick Almeida on 08/02/21.
//

import SwiftUI
import Firebase

@main
struct MuvucaApp: App {
    
    init(){
        setupFirebase()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

private extension MuvucaApp {
    func setupFirebase() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
}

