//
//  Home.swift
//  Muvuca
//
//  Created by Danilo Araújo on 09/02/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var carnival: CarnivalBlocks = CarnivalBlocks()
    
    var body: some View {
        NavigationView {
            VStack {
                HomeHeaderView(carnival: carnival)
                
                ScrollView{
                    LazyVStack {
                        CarnivalBlockList(
                            carnival: $carnival.todayBlocks,
                            images: $carnival.images
                        )
                    }
                }
            }.frame(alignment: .topLeading)
        }.navigationBarHidden(true)
    }
}
