//
//  ViewBlocksIntentHandler.swift
//  Muvuca
//
//  Created by Erick Almeida on 10/02/21.
//

import Foundation
import Intents

class ViewBlocksIntentHandler : NSObject, ViewBlocksIntentHandling {
    func resolveBlockName(for intent: ViewBlocksIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        guard let blockName = intent.blockName else {
            completion(INStringResolutionResult.needsValue())
            return
        }
        completion(INStringResolutionResult.success(with: blockName))
    }
    
    func handle(intent: ViewBlocksIntent, completion: @escaping (ViewBlocksIntentResponse) -> Void) {
        let blockName = intent.blockName!
        completion(ViewBlocksIntentResponse.success(blockName: blockName))
    }
}
