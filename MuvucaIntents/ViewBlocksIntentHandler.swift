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
        
        //if let block = getBlock(blockName: intent.blockName!) {
            completion(ViewBlocksIntentResponse.success(blockName: "Siri na Lata", blockLocation: "Rua da moeda", blockHour: "09h00", blockDate: "12/02/2021"))
        //} else {
        //    completion(ViewBlocksIntentResponse(code: .failure, userActivity: nil))
        //}
        
        // let carnival = CarnivalBlocks()
        // let blockName = intent.blockName!
        // completion(ViewBlocksIntentResponse.success(blockName: blockName))
    }
    
    func getBlock(blockName: String) -> CarnivalBlock? {
        if let block =  CarnivalBlocks().todayBlocks.first(where: {$0.name.lowercased() == blockName.lowercased()}) {
           return block
        } else {
           return nil
        }
    }
}
