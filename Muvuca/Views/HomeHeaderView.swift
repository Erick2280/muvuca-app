//
//  HomeHeaderView.swift
//  Muvuca
//
//  Created by Danilo Araújo on 11/02/21.
//

import SwiftUI

struct HomeHeaderView: View {
    
    var days: [String] = ["Sexta", "Sábado", "Domingo", "Segunda", "Terça"]
    @ObservedObject var carnival: CarnivalBlocks
    
    var body: some View {
        HStack {
            ForEach(11..<16, id: \.self) { index in
                VStack {
                    Text("\(index)")
                        .font(.title)
                    
                    Text(days[index - 11])
                    
                    Divider()
                        .padding(.bottom, 10)
                    
                }
                .padding(.top, 10)
                .onTapGesture {
                    carnival.getBlocks(by: "\(index)")
                }
            }
        }
        .background(Color("Primary"))
        
    }
}

//struct HomeHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeHeaderView()
//    }
//}
