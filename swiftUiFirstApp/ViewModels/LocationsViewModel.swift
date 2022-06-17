//
//  LocationsViewModel.swift
//  swiftUiFirstApp
//
//  Created by Abdelrahman Elsayed on 6/16/22.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    // loaded locations
    @Published var locations: [Location]
    
    // main location when first open the app
    @Published var mapLocation: Location
    
    // current region on map
    @Published var mapRegion = MKCoordinateRegion()
    
    @Published var shouldShowLocationList = false
    
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.mapRegion = updateMapRegion(locations.first!)
    }
    
    private func updateMapRegion(_ location: Location) -> MKCoordinateRegion {
        withAnimation(.easeInOut) {
            return MKCoordinateRegion(center: location.coordinates,
                                      span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        }
    }
    
    func toggleLocationList() {
        withAnimation(.easeInOut) {
            shouldShowLocationList.toggle()
        }
    }
}
