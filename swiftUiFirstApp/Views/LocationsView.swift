//
//  LocationsView.swift
//  swiftUiFirstApp
//
//  Created by Abdelrahman Elsayed on 6/16/22.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
                locationPreviewStack
                
            }
        }
        .sheet(item: $vm.presentedDetailSheet) { location in
            LocationDetailView(location: location)
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    private var header: some View {
        VStack {
            
            Button(action: vm.toggleLocationList) {
                Text(vm.mapLocation.name)
                    .font(.title2)
                    .foregroundColor(.primary)
                    .fontWeight(.medium)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.title2)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.shouldShowLocationList ? 180 : 0))
                    }
            }
            
            if vm.shouldShowLocationList {
                LocationsList()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.4),
                radius: 10, x: 0, y: 15)
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                CustomMapPinView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.5)
                    .onTapGesture {
                        vm.changeCurrentLocation(location)
                    }
            }
        })
    }
    
    private var locationPreviewStack: some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .padding()
                        .shadow(color: .black,
                                radius: 20, y: 10)
                        .transition(.asymmetric(insertion: .move(edge: .leading),
                                                removal: .move(edge: .trailing)))
                }
            }
            
        }
    }
}
