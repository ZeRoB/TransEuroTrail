//
//  TrackDetailView.swift
//  TransEuroTrail
//
//  Created by Rob on 03.03.22.
//

import MapKit
import SwiftUI
import CoreGPX

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

extension MKCoordinateRegion {
    init?(gpxWaypoints: [GPXWaypoint]) {
        var minLat: CLLocationDegrees = 90.0
        var maxLat: CLLocationDegrees = -90.0
        var minLon: CLLocationDegrees = 180.0
        var maxLon: CLLocationDegrees = -180.0
        
        for waypoint in gpxWaypoints {
            guard let lat = waypoint.latitude, let long = waypoint.longitude else {
                return nil
            }
            if lat < minLat {
                minLat = lat
            }
            if long < minLon {
                minLon = long
            }
            if lat > maxLat {
                maxLat = lat
            }
            if long > maxLon {
                maxLon = long
            }
        }
        
        let span = MKCoordinateSpan(latitudeDelta: (maxLat - minLat)*2.0, longitudeDelta: (maxLon - minLon)*2.0)
        let center = CLLocationCoordinate2DMake(maxLat - span.latitudeDelta / 4, maxLon - span.longitudeDelta / 4)
        self.init(center: center, span: span)
    }
}

struct TrackDetailView: View {
    private let gpx = GPXParser(withData: Bundle.main.loadData(from: "Germany.gpx")).parsedData()
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
//    @State private var gpxRegion: MKCoordinateRegion
    
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London ", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    let track: Track
    
    var body: some View {
        VStack {
            if let gpx = gpx {
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
        }
        .navigationTitle(track.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TrackDetail_Previews: PreviewProvider {
    static var previews: some View {
        TrackDetailView(track: Track.example)
    }
}
