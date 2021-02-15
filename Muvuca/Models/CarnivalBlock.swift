//
//  CarnivalBlock.swift
//  Muvuca
//
//  Created by Danilo Araújo on 10/02/21.
//

import Foundation
import UIKit

class CarnivalBlock: Codable, Identifiable{
    var date: String
    var hour: String
    var imageURL: String
    var location: String
    var name: String
    var image: UIImage = UIImage(systemName: "square.and.pencil")!
    var id: Int = -1
    
    func getImage(){
        let request = URLRequest(url: URL(string: self.imageURL)!)
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else{
                    return
                }
                if let image = UIImage(data: data){
                    self.image = image
                }
            }
        }.resume()
    }
    
    init(hour: String, imageURL: String, location: String, name: String, date: String, id: Int) {
        self.date = date
        self.hour = hour
        self.imageURL = imageURL
        self.location = location
        self.name = name
        self.id = id
    }
    
    enum CodingKeys: String, CodingKey {
        case date
        case hour
        case imageURL
        case location
        case name
    }
    
}
