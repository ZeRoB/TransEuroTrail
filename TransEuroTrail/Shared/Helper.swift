//
//  Helper.swift
//  TransEuroTrail
//
//  Created by Rob on 01.03.22.
//

import UIKit

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
