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
        
        ZStack{
            Color("Accent")
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { geometry in
                
                Image("onda")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(.degrees(180))
                    .position(x: 205, y: 20)
                    .frame(width: geometry.size.width , height: geometry.size.height)
                
                Image("onda")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .position(x: geometry.size.width-205, y: geometry.size.height-20)
                    .frame(width: geometry.size.width , height: geometry.size.height)
            }
            
            
            VStack{
                
                Image("dancers")
                    .resizable()
                    .frame(idealWidth: 350, idealHeight: 250, maxHeight: 250)
                    .scaledToFit()
                    .clipped()
                
                
                VStack(alignment: .leading){
                    
                    Text("Use com a Siri")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top)
                    
                    
                    Text("Você pode perguntar a Siri sobre os blocos que estão rolando perto de você e descobrir os horários e localização dos seus bloquinhos favoritos.")
                        .font(.callout)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .padding(.top)
                    
                    IntentButton()
                        .frame(width: 200, height: 60)
                        .padding(.top, 30)
                    
                } .padding(30)
            }
            
            
        }
        
    }
}

struct IntentButton: UIViewControllerRepresentable{
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<IntentButton>) -> IntentController {
        return IntentController()
    }
    
    func updateUIViewController(_ uiViewController: IntentController, context: UIViewControllerRepresentableContext<IntentButton>) {
        
    }
    
    typealias UIViewControllerType = IntentController

    
}

struct AddToSiriModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddToSiriModalView(showModal: .constant(true))
    }
}
