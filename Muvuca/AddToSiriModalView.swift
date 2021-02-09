//
//  AddToSiriView.swift
//  Muvuca
//
//  Created by Erick Almeida on 09/02/21.
//

import SwiftUI

struct AddToSiriModalView: View {
    @Binding var showModal: Bool
    
    var body: some View {
        VStack {
            Text("Use com a Siri")
                .font(.title)
            Text("Você pode peguntar a Siri sobre os blocos que estão rolando perto de você e descobrir os horários e localização dos seus bloquinhos favoritos.").multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .padding()
            
            Button("Adicionar à Siri") {
                
            } .accessibility(identifier: "AddToSiriButton")
            
            Button("Sair") {
                self.showModal.toggle()
            }
        }
    }
}

struct AddToSiriModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddToSiriModalView(showModal: .constant(true))
    }
}
