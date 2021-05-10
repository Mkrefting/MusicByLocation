//
//  CLPlacemark.swift
//  MusicByLocation
//
//  Created by Krefting, Max (PGW) on 10/05/2021.
//

import Foundation
import CoreLocation

extension CLPlacemark {
    func getLocationBreakdown() -> String {
        return
            """
            Street: \(self.thoroughfare ?? "None")
            City: \(self.locality ?? "None")
            Area: \(self.administrativeArea ?? "None")
            Country: \(self.country ?? "None")
            """
    }
}
