//
//  ArtistResponse.swift
//  MusicByLocation
//
//  Created by Krefting, Max (PGW) on 10/05/2021.
//

import Foundation

struct ArtistResponse: Codable {
    var count: Int
    var results: [Artist]
    
    private enum CodingKeys: String, CodingKey {
        case count = "resultCount"
        case results
    }
}
