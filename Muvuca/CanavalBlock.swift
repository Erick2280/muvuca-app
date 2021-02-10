//
//  Firebase.swift
//  Muvuca
//
//  Created by Alanis Lima Santa Clara on 09/02/21.
//

import SwiftUI


class CarnavalBlock: ObservableObject {
    
    var attributes: CarnavalBlock.Database
    
    init(database: CarnavalBlock.Database) {
        self.attributes = database
    }
    
    struct Database: Codable {
        
        var hour: String
        var imageUrl: String
        var location: String
        var name: String
        var date: String
        
    }
}

