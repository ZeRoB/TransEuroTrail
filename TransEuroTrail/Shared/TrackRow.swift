//
//  TrackRow.swift
//  TransEuroTrail
//
//  Created by Rob on 03.03.22.
//

import SwiftUI

struct TrackRow: View {
    let track: Track
    var body: some View {
        HStack {
            Text(track.flag)
            Text(track.name)
        }
    }
}

struct TrackRow_Previews: PreviewProvider {
    static var previews: some View {
        TrackRow(track: Track.example)
    }
}
