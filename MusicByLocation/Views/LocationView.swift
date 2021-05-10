//
//  LocationView.swift
//  MusicByLocation
//
//  Created by Krefting, Max (PGW) on 10/05/2021.
//

import SwiftUI

struct LocationView: View {
    
    var location: UserLocation
    var state: RequestState
    
    var body: some View{
        if state == .idle{
            VStack(alignment: .leading){
                Text("Street: \(location.thoroughfare)")
                Text("City: \(location.locality)")
                Text("Area: \(location.administrativeArea)")
                Text("Country: \(location.country)")
            }
        }
    }
}
