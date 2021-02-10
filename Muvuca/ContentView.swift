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
            CarnivalBlockList()
            
            Button(action: {
                showAddToSiriModal.toggle()
            }) {
                Text("Que tal usar com a Siri?")
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
