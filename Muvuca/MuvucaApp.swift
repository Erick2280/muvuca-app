//
//  MuvucaApp.swift
//  Muvuca
//
//  Created by Erick Almeida on 08/02/21.
//

import SwiftUI
import Intents
import Firebase

@main
struct MuvucaApp: App {
    
    init() {
        donateIntent()
        setupFirebase()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

private extension MuvucaApp {
    func donateIntent(){
        let intent = ViewBlocksIntent()
        intent.suggestedInvocationPhrase = "Cadê o bloco"
        let interaction = INInteraction(intent: intent, response: nil)
            
        interaction.donate { (error) in
            if error != nil {
                if let error = error as NSError? {
                    print("Interaction donation failed: \(error.description)")
                } else {
                    print("Successfully donated interaction")
                }
            }
        }
    }
    func setupFirebase() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
}

