//
//  Helper.swift
//  TransEuroTrail
//
//  Created by Rob on 01.03.22.
//

import UIKit
import MapKit
import CoreGPX

extension Bundle {
    func loadData(from file: String) -> Data {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        return data
    }
    
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        let data = loadData(from: file)

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}

extension MKCoordinateRegion {
    init(waypoints: [CLLocationCoordinate2D]) {
        var minLat: CLLocationDegrees = 90.0
        var maxLat: CLLocationDegrees = -90.0
        var minLon: CLLocationDegrees = 180.0
        var maxLon: CLLocationDegrees = -180.0
        
        for waypoint in waypoints {
            let lat = Double(waypoint.latitude)
            let long = Double(waypoint.longitude)
            
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
        
        let span = MKCoordinateSpan(latitudeDelta: (maxLat - minLat) * 1.5, longitudeDelta: (maxLon - minLon) * 1.5)
        let center = CLLocationCoordinate2DMake(maxLat - span.latitudeDelta / 3, maxLon - span.longitudeDelta / 3)
        self.init(center: center, span: span)
    }
}
