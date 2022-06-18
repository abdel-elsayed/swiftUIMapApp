//
//  Location.swift
//  swiftUiFirstApp
//
//  Created by Abdelrahman Elsayed on 6/16/22.
//

import Foundation
import CoreLocation

struct Location: Identifiable, Equatable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    // identifiable
    var id: String {
        name + cityName
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
       return lhs.id == rhs.id
    }
}
