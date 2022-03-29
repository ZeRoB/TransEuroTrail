//
//  TrackDetailViewModel.swift
//  TransEuroTrail
//
//  Created by Rob on 29.03.22.
//

import Foundation
import CoreGPX
import CoreLocation
import MapKit

struct TrackDetailViewModel {
    private let gpx = GPXParser(withData: Bundle.main.loadData(from: "Germany.gpx")).parsedData()
    var tracks: [[CLLocationCoordinate2D]]
    var mapRegion: MKCoordinateRegion
    
    init() {
        
        guard let gpx = gpx else {
            fatalError()
        }
        tracks = []
        for track in gpx.tracks {
            for segment in track.segments {
                var track = [CLLocationCoordinate2D]()
                for point in segment.points {
                    if let latitude = point.latitude, let longitude = point.longitude {
                        track.append(CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                    }
                }
                tracks.append(track)
            }
        }
        mapRegion = MKCoordinateRegion(waypoints: tracks.flatMap({ $0 }))
    }
    
}
