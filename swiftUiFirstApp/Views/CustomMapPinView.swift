//
//  CustomMapPinView.swift
//  swiftUiFirstApp
//
//  Created by Abdelrahman Elsayed on 6/17/22.
//

import SwiftUI

struct CustomMapPinView: View {
    var body: some View {

        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding(6)
                .foregroundColor(.white)
                .background(Color("AccentColor"))
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .foregroundColor(Color("AccentColor"))
        }
    }
}

struct CustomMapPinView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            CustomMapPinView()
        }
    }
}
