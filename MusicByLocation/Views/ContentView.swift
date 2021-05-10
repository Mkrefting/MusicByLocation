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
        VStack{
            Text(state.lastKnownLocation)
                .padding()
            Text(state.artistsByLocation)
                .padding()
            Spacer()
            Button("Find Music", action: {
                    state.findMusic()
            })
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
