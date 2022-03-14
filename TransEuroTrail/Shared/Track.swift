//
//  Track.swift
//  TransEuroTrail
//
//  Created by Rob on 01.03.22.
//

import Foundation


struct Track: Codable, Identifiable {
    var id: UUID
    var name: String
    var flag: String
    var url: URL
    
#if DEBUG
    static let example = Track(id: UUID(), name: "Germany", flag: "🇩🇪", url: URL(string: "https://transeurotrail.org")!)
#endif
}


