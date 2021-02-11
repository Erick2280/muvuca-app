//
//  Home.swift
//  Muvuca
//
//  Created by Danilo Araújo on 09/02/21.
//

import SwiftUI

struct CarnivalBlockList: View {
    
    @ObservedObject var carnival: CarnivalBlocks = CarnivalBlocks()
    @State var navigatedToBlock = false
    
    var body: some View {
//        NavigationView {
            HomeHeaderView()
            
            ForEach(0..<carnival.images.count, id: \.self) {index in
                HStack {
                    CarnivalBlockView(
                        block: $carnival.blocks[index],
                        blockImage: $carnival.images[index]
                    )
                    
//                    NavigationLink(
//                        destination: SelectPrizeView(
//                            isActive: $navigatedToBlock,
//                        ),
//                        isActive: true,
//                        label: {
//                            Image(systemName: "chevron.right")
//                                .font(.body)
//                    })
                }
            }
//        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        CarnivalBlockList()
    }
}
