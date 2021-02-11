//
//  MapView.swift
//  Muvuca
//
//  Created by Alanis Lima Santa Clara on 10/02/21.
//
import MapKit
import SwiftUI

struct MapView: View {
    
    //pesquisar Viewmodel, com observ. obj. para ler o firebase e ler os dados do mapa
//
//    @Binding var latitude: String
//    @Binding var longitude: String
//
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    var body: some View {
        Map(coordinateRegion: $region)
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
//        (latitude: , longitude: <#T##Binding<String>#>)
    }
}


//o que fazer: mapa na tela inteira e mexer o mapa no outro arquivo(profile define o tamanho)
