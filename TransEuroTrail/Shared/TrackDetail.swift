//
//  TrackDetail.swift
//  TransEuroTrail
//
//  Created by Rob on 03.03.22.
//

import MapKit
import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct TrackDetail: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London ", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    let track: Track
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    VStack {
                        Circle()
                        .stroke(.red, lineWidth: 3)
                        .frame(width: 44, height: 44)
                        .onTapGesture {
                            print("Tapped on \(location.name)")
                        }
                        Text(location.name)
                    }
                }
            }
            Text(track.flag)
        }
        .navigationTitle(track.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TrackDetail_Previews: PreviewProvider {
    static var previews: some View {
        TrackDetail(track: Track.example)
    }
}
