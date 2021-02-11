//
//  ProfileView.swift
//  Muvuca
//
//  Created by Danilo Araújo on 11/02/21.
//


import SwiftUI

struct ProfileView: View {
    
    @Binding var block: CarnivalBlock
        
    var body: some View {
    
        VStack{
            HStack{
                Text("\(block.imageURL)")
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
            }.padding(.top, 80.0)
            
//            MapView().frame(minWidth: 200, idealWidth: 200, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 300, idealHeight: 200, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                    .scaledToFill()
                
                VStack(alignment: .leading){
                    Text("# \(block.name)")
                        .padding(.trailing, 1.0)
                }

            }
        }
        
    }
}




//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView(image: "imagem", bloco: "bloco", endereco: "endereco", horario: "5h00")
//    }
//}
