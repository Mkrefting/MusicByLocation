//
//  ArtistRowView.swift
//  MusicByLocation
//
//  Created by Krefting, Max (PGW) on 10/05/2021.
//

import SwiftUI

struct ArtistRowView: View {
    
    var artist: Artist
    
    var body: some View {
        HStack{
            Link(artist.name, destination: URL(string: artist.url)!)
            Spacer()
            Text(artist.genre ?? "").font(.caption)
        }
    }
}
