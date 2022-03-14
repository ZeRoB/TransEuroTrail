//
//  TracksView.swift
//  Shared
//
//  Created by Rob on 25.02.22.
//

import SwiftUI

struct TracksView: View {
    let tracks = Bundle.main.decode([Track].self, from: "tracks.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tracks) { track in
                    NavigationLink(destination: TrackDetail(track: track)) {
                        TrackRow(track: track)
                    }
                }
            }
            .navigationTitle("Tracks")
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TracksView()
    }
}
