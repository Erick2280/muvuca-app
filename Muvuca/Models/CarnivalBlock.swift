//
//  CarnivalBlock.swift
//  Muvuca
//
//  Created by Danilo Araújo on 10/02/21.
//

import Foundation


struct CarnivalBlock: Codable, Identifiable {
    var hour: String
    var imageUrl: String
    var location: String
    var name: String
    var date: String
    var id: String
}
