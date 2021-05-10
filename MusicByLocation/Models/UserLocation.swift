//
//  UserLocation.swift
//  MusicByLocation
//
//  Created by Krefting, Max (PGW) on 10/05/2021.
//

import Foundation

struct UserLocation {
    
    var error: String = ""
    
    var name: String = ""
    var thoroughfare: String = ""
    var locality: String = "" // city associated with the placemark
    var administrativeArea: String = ""
    var country: String = ""
    
    mutating func error(_ error: String = "Unkown error"){
        self.error = error
        self.name = "Unkown"
        self.thoroughfare = ""
        self.locality = ""
        self.administrativeArea = ""
        self.country = ""
        
    }
    
}
