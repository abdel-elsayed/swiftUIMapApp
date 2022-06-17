//
//  swiftUiFirstAppApp.swift
//  swiftUiFirstApp
//
//  Created by Abdelrahman Elsayed on 6/16/22.
//

import SwiftUI

@main
struct swiftUiFirstAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
