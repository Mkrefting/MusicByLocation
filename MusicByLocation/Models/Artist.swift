//
//  Artist.swift
//  MusicByLocation
//
//  Created by Krefting, Max (PGW) on 10/05/2021.
//

import Foundation

struct Artist: Codable {
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "artistName"
    }
}
