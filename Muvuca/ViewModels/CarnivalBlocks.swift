//
//  Firebase.swift
//  Muvuca
//
//  Created by Alanis Lima Santa Clara on 09/02/21.
//

import SwiftUI


class CarnivalBlocks: ObservableObject {
    
    static let shared = CarnivalBlocks()
    
    var blocks: [CarnivalBlock] = []
    
    @Published var images: [UIImage] = []
    @Published var todayBlocks: [CarnivalBlock] = []
    
    init() {
        FirebaseHandler.readAllCollection(.blocks, dataType: [CarnivalBlock].self, completion: { result in
            if case .success(let resultBlocks) = result {
                self.blocks.append(contentsOf: resultBlocks.map{ $0 })
                self.getBlocks(by: self.today())
            }
        })
    }
    
    private func getImage(_ block: CarnivalBlock){
        
        let request = URLRequest(url: URL(string: block.imageURL)!)
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else{
                    return
                }
                if let image = UIImage(data: data){
                    self.images.append(image)
                }
            }
        }.resume()
    }
    
    /// Filter blocks by day
    /// - Parameters:
    ///   - day: The day that you want to get blocks from
    func getBlocks(by day: String) {
        self.images = []
        self.todayBlocks = []
        
        self.todayBlocks = blocks.filter {
            return $0.date == "\(day)/02/2021";
        }
                
        for block in todayBlocks {
            self.getImage(block)
        }
    }
    
    func today() -> String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: date)
    }
}

