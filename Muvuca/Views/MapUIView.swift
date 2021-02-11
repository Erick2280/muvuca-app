//  MapView.swift
//  Muvuca
//
//  Created by Alanis Lima Santa Clara on 11/02/21.

import SwiftUI
import MapKit


final class Checkpoint: NSObject, MKAnnotation {
  let title: String?
  let coordinate: CLLocationCoordinate2D
  
  init(title: String?, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.coordinate = coordinate
  }
}

struct MapViewAdvance: UIViewRepresentable {
  @Binding var checkpoints: [Checkpoint]
  
  func makeUIView(context: Context) -> MKMapView {
    MKMapView()
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
    uiView.addAnnotations(checkpoints)
  }
}

struct ContentViewAdvance: View {
  @State var checkpoints: [Checkpoint] = [
    Checkpoint(title: "Saída do Siri Na Lata", coordinate: .init(latitude: -8.064647, longitude: -34.872838))
  ]
  
  var body: some View {
    MapViewAdvance(checkpoints: $checkpoints)
  }
}

struct ContentViewAdvance_Previews: PreviewProvider {
  static var previews: some View {
    ContentViewAdvance()
  }
}
