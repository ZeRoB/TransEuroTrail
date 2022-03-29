//
//  TrackDetailView.swift
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

struct TrackDetailView: View {
    let track: Track
    @State private var viewModel = TrackDetailViewModel()
  
    
    var body: some View {
        VStack {
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
