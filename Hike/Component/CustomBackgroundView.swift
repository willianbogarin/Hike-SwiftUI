//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Willian Bogarin Jr on 2023. 09. 16..
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            //MARK: - 3. DEPTH
            Color.colorGreenDark
                .cornerRadius(40)
                .offset(y:12)
            
            //MARK: - 2. LIGHT
            
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            //MARK: - 1. SURFACE
            
            LinearGradient(colors: [
                .colorGreenLight,
                .colorGreenMedium
            ],
                           startPoint: .top
                           , endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
}

struct CustomBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackgroundView()
            .padding()
    }
}
