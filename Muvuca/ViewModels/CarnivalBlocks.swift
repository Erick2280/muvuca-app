//
//  Firebase.swift
//  Muvuca
//
//  Created by Alanis Lima Santa Clara on 09/02/21.
//

import SwiftUI

class CarnivalBlocks: ObservableObject {
    
    static let shared = CarnivalBlocks()
    
    private var blocks: [CarnivalBlock] = []
    
    @Published var todayBlocks: [CarnivalBlock] = []
        
    init() {
        FirebaseHandler.readAllCollection(.blocks, dataType: [CarnivalBlock].self, completion: { result in
            if case .success(let resultBlocks) = result {
                self.blocks.append(contentsOf: resultBlocks.map{ $0 })
                self.getBlocks(by: CarnivalBlocks.today())
            }
        })
    }
    
    /// Filter blocks by day
    /// - Parameters:
    ///   - day: The day that you want to get blocks from
    func getBlocks(by day: String) {
        self.todayBlocks = []
        
        self.todayBlocks = blocks.filter {
            $0.getImage();
            return $0.date == "\(day)/02/2021";
        }
    }
    
    
    static func today() -> String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: date)
    }
}

