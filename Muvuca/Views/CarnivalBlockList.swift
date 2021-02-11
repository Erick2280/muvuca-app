//
//  Home.swift
//  Muvuca
//
//  Created by Danilo Araújo on 09/02/21.
//

import SwiftUI

struct CarnivalBlockList: View {
    
    @ObservedObject var carnival: CarnivalBlocks = CarnivalBlocks()
    
    var body: some View {
        
        HomeHeaderView()
        
        ForEach(0..<carnival.images.count, id: \.self) {block  in
            HStack {
                Image(uiImage: carnival.images[block])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 64, height: 64)
                    .padding()
                
            
                VStack(alignment: .leading) {
                    Text(carnival.blocks[block].name)
                        .font(.body)
                        .bold()
                        .accessibility(identifier: "CarnivalBlockTitle")
                    
                    HStack {
                        Text(carnival.blocks[block].location)
                        .accessibility(identifier: "CarnivalBlockLocation")
                        
                        Image(systemName: "map")
                            .foregroundColor(Color("Icons"))
                    }
                    
                    
                    HStack {
                        Text(carnival.blocks[block].hour)
                        .accessibility(identifier: "CarnivalBlockHour")
                        
                        Image(systemName: "clock")
                            .foregroundColor(Color("Icons"))
                        
                    }
                }.foregroundColor(Color("Secondary"))
                
                Button(action: {
                    
                }) {
                    Image(systemName: "chevron.right")
                        .font(.body)
                }.padding()
            }
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        CarnivalBlockList()
    }
}
