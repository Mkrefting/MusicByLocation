//
//  StateController.swift
//  MusicByLocation
//
//  Created by Krefting, Max (PGW) on 10/05/2021.
//

import Foundation

class StateController: ObservableObject {
    @Published var lastKnownLocation: String = ""
    @Published var lastKnownTown: String = "" {
        didSet {
            getArtists(term: lastKnownTown)
        }
    }
    @Published var artistsByLocation: String = ""
    let locationHandler: LocationHandler = LocationHandler()
    
    func findMusic(){
        locationHandler.requestLocation()
    }
    
    func requestAccessToLocationData() {
        locationHandler.stateController = self
        locationHandler.requestAuthorisation()
    }
    
    func getArtists(term: String) {
        let searchableTerm = term.replacingOccurrences(of: " ", with: "%20")
        print("Searchable term: \(searchableTerm)")
        let urlString = "https://itunes.apple.com/search?term=\(searchableTerm)&entity=musicArtist"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    let names = response.results.map {
                        return $0.name
                    }
                    DispatchQueue.main.async {
                        self.artistsByLocation = names.joined(separator: ", ")
                    }
                }
            }
        }.resume()
    }
    
    func parseJson(json: Data) -> ArtistResponse? {
        let decoder = JSONDecoder()
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("Error decoding JSON")
            return nil
        }
    }
    
    
    
}
