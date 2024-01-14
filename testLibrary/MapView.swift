//
//  MapView.swift
//  testLibrary
//
//  Created by Javidan Ibrahimov on 15.11.23.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }


    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 58.37657197970556, longitude: 26.73357461825213),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    }
}
//58.37657197970556, 26.73357461825213

#Preview {
    MapView()
}
