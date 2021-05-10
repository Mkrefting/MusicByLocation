//
//  StateController.swift
//  MusicByLocation
//
//  Created by Krefting, Max (PGW) on 10/05/2021.
//

import Foundation

enum RequestState {
    case none // no request yet
    case requesting
    case idle // request completed, but still option to request again
}

class StateController: ObservableObject {
    
    let locationHandler: LocationHandler = LocationHandler()
    let iTunesAdaptor = ITunesAdaptor()
    
    @Published var artistsByLocation: [Artist] = []
    @Published var requestState: RequestState = .none

    @Published var userLocation = UserLocation() {
        didSet {
            iTunesAdaptor.getArtists(term: userLocation.locality, completion: updateArtistsByLocation)
            requestState = .idle
        }
    }
    
    func findMusic(){
        requestState = .requesting
        locationHandler.requestLocation()
    }
    
    func requestAccessToLocationData() {
        locationHandler.stateController = self
        locationHandler.requestAuthorisation()
    }
    
    func updateArtistsByLocation(artists: [Artist]?) {
        DispatchQueue.main.async {
            if let artists = artists {
                self.artistsByLocation = artists
            }
        }
    }
}
