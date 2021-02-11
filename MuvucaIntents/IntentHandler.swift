//
//  IntentHandler.swift
//  MuvucaIntents
//
//  Created by Erick Almeida on 10/02/21.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        if (intent is ViewBlocksIntent) {
            return ViewBlocksIntentHandler()
        }
        
        fatalError("Unhandled Intent error : \(intent)")
    }
    
}
