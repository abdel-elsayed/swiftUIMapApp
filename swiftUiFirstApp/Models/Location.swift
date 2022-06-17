//
//  Location.swift
//  swiftUiFirstApp
//
//  Created by Abdelrahman Elsayed on 6/16/22.
//

import Foundation
import CoreLocation

struct Location: Identifiable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    
    var id: String {
        name + cityName
    }
}
