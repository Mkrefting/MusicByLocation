//
//  Artist.swift
//  MusicByLocation
//
//  Created by Krefting, Max (PGW) on 10/05/2021.
//

import Foundation

struct Artist: Codable, Hashable {
    var name: String
    var genre: String?
    var url: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "artistName"
        case genre = "primaryGenreName"
        case url = "artistLinkUrl"
    }
}
