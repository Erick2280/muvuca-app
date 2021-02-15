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
                        ForEach(carnival.todayBlocks) {block in
                            HStack {
                                CarnivalBlockView(block: block)
                                
                                Spacer()
                                
                                NavigationLink(
                                    destination: ProfileView(block: block),
                                    tag: block.id,
                                    selection: $navigatedToBlock,
                                    label: {
                                        Image(systemName: "chevron.right")
                                            .font(.body)
                                            .foregroundColor(Color("Accent"))
                                            .onTapGesture {
                                                self.navigatedToBlock = block.id
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
