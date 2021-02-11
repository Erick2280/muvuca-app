//
//  HomeHeaderView.swift
//  Muvuca
//
//  Created by Danilo Araújo on 11/02/21.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        HStack {
            ForEach(11..<16, id: \.self) { index in
                VStack {
                    Text("\(index)")
                        .font(.title)
                    
                    Text("Sexta")
                    
                    Divider()
                        .padding(.bottom, 10)
                    
                }.padding(.top, 10)
            }
        }
        .background(Color("Primary"))
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
    }
}
