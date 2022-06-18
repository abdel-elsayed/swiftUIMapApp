//
//  LocationDetailView.swift
//  swiftUiFirstApp
//
//  Created by Abdelrahman Elsayed on 6/17/22.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                imageCarouselComponent
                VStack(alignment: .leading) {
                    titleSection
                    Divider()
                    descriptionComponent
                    smallMapComponent
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .ignoresSafeArea()
        }.overlay(alignment: .topLeading) {
            cancelButton
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
    }
}

extension LocationDetailView{
    private var imageCarouselComponent: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .tabViewStyle(.page)
        .shadow(color: .black, radius: 10, y: 1)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .frame(height: 500)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title2)
                .foregroundColor(.secondary)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var descriptionComponent: some View {
        VStack(alignment: .leading) {
            Text(location.description)
                .font(.body)
                .foregroundColor(.secondary)
            Link("Read more on Wiki...", destination: URL(string: location.link)!)
                .padding(4)
                .foregroundColor(.blue)
        }.frame(maxWidth: .infinity)
    }
    
    private var smallMapComponent: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates,
                                                           span: MKCoordinateSpan(latitudeDelta: 0.01,
                                                                                  longitudeDelta: 0.01))),
            annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                CustomMapPinView()
            }
        }.allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(20)
    }
    
    private var cancelButton: some View {
        Button {
            vm.presentedDetailSheet = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.ultraThickMaterial)
                .cornerRadius(10)
                .padding()
        }
    }
}
