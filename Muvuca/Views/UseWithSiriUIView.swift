//
//  UseWithSiriView.swift
//  Muvuca
//
//  Created by Alanis Lima Santa Clara on 11/02/21.
//

import SwiftUI

struct UseWithSiriView: View {
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
                    
                    
                    Button(action: {
                    }) {
                        HStack {
                            Image("siriicon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 40)
                                .padding(5)
                            
                            VStack(alignment: .leading) {
                                Text("Adicionar a Siri")
                                    .font(.callout)
                                    .bold()
                            }.padding()
                            
                            Spacer()
                        }
                        .accentColor(.black)
                        .background(Image("white"))
                        .cornerRadius(20)
                        .padding(.trailing, 120)
                        .padding(.top, 20)
                        
                    }
                    
                } .padding(30)
            }
            
            
        }
        
    }
}

struct UseWithSiriView_Previews: PreviewProvider {
    static var previews: some View {
        UseWithSiriView()
    }
}
