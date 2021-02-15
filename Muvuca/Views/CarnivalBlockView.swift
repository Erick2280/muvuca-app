//
//  CarnivalBlockView.swift
//  Muvuca
//
//  Created by Danilo Araújo on 11/02/21.
//

import SwiftUI

struct CarnivalBlockView: View {
    
    var block: CarnivalBlock

    var body: some View {
        Image(uiImage: block.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .frame(width: 64, height: 64)
            .padding()
        
    
        VStack(alignment: .leading) {
            Text(block.name)
                .font(.body)
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
    }
}
