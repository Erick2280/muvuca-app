//
//  ContentView.swift
//  Muvuca
//
//  Created by Erick Almeida on 08/02/21.
//
import Firebase
import SwiftUI

struct ContentView: View {
    @State var showAddToSiriModal = false
    
    var body: some View {
        VStack {
            Rectangle()
                .ignoresSafeArea()
                .frame(height: 20)
                .foregroundColor(Color("Primary"))
                .padding(.bottom, -20)
            
            HomeView(carnival: CarnivalBlocks.shared)
            
            Button(action: {
                showAddToSiriModal.toggle()
            }) {
                HStack {
                    Image("siriicon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .padding(5)
                    
                    VStack(alignment: .leading) {
                        Text("Que tal usar com a Siri?")
                            .font(.title3)
                            .bold()
                        Text("Encontre blocos apenas com a voz")
                            .font(.caption)
                    }.padding()
                    
                    Spacer()
                }
                .accentColor(.white)
                .background(Image("siribg"))
                .cornerRadius(10)
                .padding(.trailing, 20)
                .padding(.leading, 20)

                
            }
            .sheet(isPresented: $showAddToSiriModal) {
                AddToSiriModalView(showModal: self.$showAddToSiriModal)
            }
            .accessibility(identifier: "UseWithSiriButton")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
