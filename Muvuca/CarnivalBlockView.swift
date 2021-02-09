//
//  CarnivalBlockView.swift
//  Muvuca
//
//  Created by Danilo Araújo on 09/02/21.
//

import SwiftUI

struct CarnivalBlockView: View {
    var body: some View {
        HStack {
            Image(systemName: "chevron.backward.circle")
                .font(.largeTitle)
                .padding()
            
        
            VStack(alignment: .leading) {
                Text("Siri na lata")
                    .font(.title)
                    .bold()
                    .accessibility(identifier: "CarnivalBlockTitle")
                
                HStack {
                    Text("Rua da moeda")
                    .accessibility(identifier: "CarnivalBlockLocation")
                    
                    Image(systemName: "map")
                        .foregroundColor(Color("Icons"))
                    
                }
                
                
                HStack {
                    Text("09:00")
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

struct CarnivalBlockView_Previews: PreviewProvider {
    static var previews: some View {
        CarnivalBlockView()
    }
}
