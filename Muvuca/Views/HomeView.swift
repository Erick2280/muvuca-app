//
//  Home.swift
//  Muvuca
//
//  Created by Danilo Araújo on 09/02/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var carnival: CarnivalBlocks
    @State var navigatedToBlock: Int? = nil

    var body: some View {
        NavigationView {
            VStack {
                HomeHeaderView(carnival: carnival)
                
                ScrollView{
                    VStack {
                        ForEach(0..<carnival.images.count, id: \.self) {index in
                            HStack {
                                CarnivalBlockView(
                                    block: $carnival.todayBlocks[index],
                                    blockImage: $carnival.images[index]
                                )
                                
                                Spacer()
                                
                                NavigationLink(
                                    destination: ProfileView(block: $carnival.todayBlocks[index]),
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
            }
            
            .navigationBarHidden(true)
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
        }
    }
}
