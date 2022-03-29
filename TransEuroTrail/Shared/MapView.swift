//
//  MapView.swift
//  TransEuroTrail
//
//  Created by Rob on 29.03.22.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var mapRegion: MKCoordinateRegion
    @Binding var tracks: [[CLLocationCoordinate2D]]
    private let delegate: MapViewDelegate
    
    init(mapRegion: Binding<MKCoordinateRegion>, tracks: Binding<[[CLLocationCoordinate2D]]>) {
        _mapRegion = mapRegion
        _tracks = tracks
        delegate = MapViewDelegate()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = delegate
        for track in tracks {
            let polyline = MKPolyline(coordinates: track, count: track.count)
            mapView.addOverlay(polyline)
        }
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.region = mapRegion
    }
}

class MapViewDelegate: NSObject, MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let routePolyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: routePolyline)
            renderer.strokeColor = .red
            renderer.lineWidth = 5
            return renderer
          }
          return MKOverlayRenderer()
    }
}
