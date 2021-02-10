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
        ForEach(carnival.blocks) {block  in
            HStack {
                Image(systemName: "chevron.backward.circle")
                    .font(.largeTitle)
                    .padding()
                
            
                VStack(alignment: .leading) {
                    Text(block.name)
                        .font(.title)
                        .bold()
                        .accessibility(identifier: "CarnivalBlockTitle")
                    
                    HStack {
                        Text(block.location)
                        .accessibility(identifier: "CarnivalBlockLocation")
                        
                        Image(systemName: "map")
                            .foregroundColor(Color("Icons"))
                        
                    }
                    
                    
                    HStack {
                        Text(block.hour)
                        .accessibility(identifier: "CarnivalBlockHour")
                        
                        Image(systemName: "clock")
                            .foregroundColor(Color("Icons"))
                        
                    }
                }.foregroundColor(Color("Secondary"))
                
                Spacer()
                
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
