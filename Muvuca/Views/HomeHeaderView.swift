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
    @State var selectedDay: Int = 11
    
    var body: some View {
        HStack {
            ForEach(11..<16, id: \.self) { index in
                VStack {
                    Text("\(index)")
                        .font(index == selectedDay ? .largeTitle : . title)
                        .foregroundColor("\(index)" < carnival.today() ? .gray : .white)
                    
                    Text(days[index - 11])
                        .foregroundColor("\(index)" < carnival.today() ? .gray : .white)
                    
                    Divider()
                        .padding(.bottom, 10)
                    
                }
                .onTapGesture {
                    self.selectedDay = index
                    carnival.getBlocks(by: "\(index)")
                }
            }.padding(.top, 10)
        }
        
        .background(Color("Primary"))
        
    }
}

//struct HomeHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeHeaderView()
//    }
//}
