//
//  Firebase.swift
//  Muvuca
//
//  Created by Alanis Lima Santa Clara on 09/02/21.
//

import SwiftUI


class CarnivalBlocks: ObservableObject {
    
    @Published var blocks: [CarnivalBlock] = []
    var images: [UIImage] = []
    
    
    init() {
        FirebaseHandler.readAllCollection(.carnavalBlock, dataType: [CarnivalBlock].self, completion: { result in
            if case .success(let resultBlocks) = result {
                print("Teste0")
                self.blocks.append(contentsOf: resultBlocks.map{ $0 })
            }
        })
        print(self.blocks.count)
    }
    
    private func getImage(_ block: CarnivalBlock){
        
        let request = URLRequest(url: URL(string: block.imageUrl)!)
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
    
    /// Get carnival blocks by day
    /// - Parameters:
    ///   - day: The day that you want to get blocks from
    func getBlocks(by day: String) -> [CarnivalBlock] {
        return []
    }
    
    
    
    

}

