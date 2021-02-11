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
                HomeHeaderView()
                
                ScrollView{
                    LazyVStack {
                        CarnivalBlockList(
                            carnival: $carnival.blocks,
                            images: $carnival.images
                        )
                    }
                }
            }.frame(alignment: .topLeading)
        }
    }
}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
