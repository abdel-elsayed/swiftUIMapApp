//
//  LocationsList.swift
//  swiftUiFirstApp
//
//  Created by Abdelrahman Elsayed on 6/16/22.
//

import SwiftUI

struct LocationsList: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
             listRowView(location: location)
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
            }
        }
    }
}

struct LocationsList_Previews: PreviewProvider {
    static var previews: some View {
        LocationsList()
            .environmentObject(LocationsViewModel())

    }
}

private func listRowView(location: Location) -> some View {
    HStack {
        if let imageName = location.imageNames.first{
             Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 45, height: 45)
                .padding(.horizontal,6)
                .cornerRadius(13)
        }
        
        VStack(alignment: .leading) {
            Text(location.name)
            Text(location.cityName)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .background(Color.clear)
}
