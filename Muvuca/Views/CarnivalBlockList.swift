//
//  CarnivalBlockList.swift
//  Muvuca
//
//  Created by Danilo Araújo on 11/02/21.
//

import SwiftUI

struct CarnivalBlockList: View {
    
    @Binding var carnival: [CarnivalBlock]
    @Binding var images: [UIImage]
    @State var navigatedToBlock: Int? = nil
    
    var body: some View {
        ForEach(0..<images.count, id: \.self) {index in
            HStack {
                CarnivalBlockView(
                    block: $carnival[index],
                    blockImage: $images[index]
                )
                
                Spacer()
                
                NavigationLink(
                    destination: ProfileView(block: $carnival[index]),
                    tag: index,
                    selection: $navigatedToBlock,
                    label: {
                        Image(systemName: "chevron.right")
                            .font(.body)
                            .foregroundColor(Color("Accent"))
                            .onTapGesture {
                                self.navigatedToBlock = index
                            }
                    }
                ).padding(.trailing, 30)
            }
        }
    }
}

