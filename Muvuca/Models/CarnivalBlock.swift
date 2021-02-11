//
//  CarnivalBlock.swift
//  Muvuca
//
//  Created by Danilo Araújo on 10/02/21.
//

import Foundation


class CarnivalBlock: Codable{
    var date: String
    var hour: String
    var imageURL: String
    var location: String
    var name: String
    

    init(hour: String, imageURL: String, location: String, name: String, date: String) {
        self.date = date
        self.hour = hour
        self.imageURL = imageURL
        self.location = location
        self.name = name
    }
    
}
