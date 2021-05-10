//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Krefting, Max (PGW) on 10/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var state = StateController()
    
    var body: some View {
        ZStack{
            VStack{
                
                LocationView(location: state.userLocation, state: state.requestState)
                
                List{
                    ForEach(state.artistsByLocation, id: \.self) { artist in
                        ArtistRowView(artist: artist)
                    }
                }
                
                Spacer()
                
                Button("Find Music", action: {
                        state.findMusic()
                })
                
            }

            if state.requestState == .requesting {
                LoaderView()
            }
            
        }.onAppear(perform: {
            state.requestAccessToLocationData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
