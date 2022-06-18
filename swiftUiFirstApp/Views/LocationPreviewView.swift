//
//  LocationPreviewView.swift
//  swiftUiFirstApp
//
//  Created by Abdelrahman Elsayed on 6/17/22.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    
    var body: some View {
        ZStack() {
            HStack(alignment: .bottom) {
                VStack {
                    imageComponent
                    titleComponent
                }
                
                Spacer()

                VStack(alignment: .center, spacing: 10.0) {
                    LearnMoreButton
                    NextButton
                }
            }
        }
        .padding(20)
        .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThinMaterial)
                    .offset(y: 45)
            )
            .clipped()
            .cornerRadius(10)
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
    }
}

extension LocationPreviewView {
    private var imageComponent: some View {
        Image(location.imageNames.first ?? "")
            .resizable()
            .scaledToFill()
            .frame(width: 100,
                   height: 100)
            .cornerRadius(10)
            .padding(6)
            .background(.white)
            .cornerRadius(10)
    }
    
    private var titleComponent: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(location.name)
                .font(.headline)
            Text(location.cityName)
                .font(.subheadline)
        }
    }
    
    private var LearnMoreButton: some View {
        Button {
            vm.presentedDetailSheet = location
        } label: {
            Text("Learn more")
                .frame(width: 125, height: 25)
                .font(.headline)
            
        }.buttonStyle(.borderedProminent)
    }
    
    private var NextButton: some View {
        Button {
            vm.nextButtonClicked()
        } label: {
            Text("Next")
                .frame(width: 125, height: 25)
                .font(.headline)
        }.buttonStyle(.bordered)
    }
}
