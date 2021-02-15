//
//  ProfileView.swift
//  Muvuca
//
//  Created by Danilo Araújo on 11/02/21.
//


import SwiftUI

struct ProfileView: View {
    
    @State var block: CarnivalBlock
    @State var checkpoints: [Checkpoint] = [Checkpoint(title: "Saída do Bloco", coordinate: .init(latitude: -8.064647, longitude: -34.872838))]

        
    var body: some View {
    
        ZStack{
            Color("Primary")
                .edgesIgnoringSafeArea(.all)
            
        VStack{
            HStack{
                Image(uiImage: block.image)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 5)
                    .padding()
                
                VStack(alignment: .leading){
                    Text("\(block.name)")
                        .font(.body)
                    Text("\(block.location)")
                        .font(.footnote)
                }.padding()
                
                .padding()

                Text("\(block.hour)")
                    .font(.footnote)
            }.padding(.top, -50.0)
            
            MapViewAdvance(checkpoints: $checkpoints)
                .edgesIgnoringSafeArea(.all)

            }
        .foregroundColor(.white)
        }
    }
        
    }




//struct ProfileView_Previews: PreviewProvider {
//    
//    @State static var block = CarnivalBlock(hour: "14h00", imageURL: "https://vejasp.abril.com.br/wp-content/uploads/2019/02/sargento-pimenta-abre-o-carnaval-de-sc3a3o-paulo-com-grandes-bonecc3b5es-dos-beatles.jpg", location: "Rua Tomazina", name: "Bloco de Testes", date: "Quinta")
//    
////    static var previews: some View {
////        ProfileView(block: $block)
////    }
////}
