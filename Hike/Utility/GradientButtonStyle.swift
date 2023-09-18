//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Willian Bogarin Jr on 2023. 09. 16..
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal,30)
            .background(
                //conditional statement with ternary operator
                // Condition ? A : B
                //: A: When user pressed the button
                //: B: When the button is not pressed
                configuration.isPressed ?
                
                LinearGradient(colors:[.colorGrayLight,.colorGrayMedium],startPoint: .top,endPoint: .bottom)
                :
                    LinearGradient(colors:[.colorGrayMedium,.colorGrayLight],startPoint: .top,endPoint: .bottom)
                
            )
            .cornerRadius(40)
    }
    
}
