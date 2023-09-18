//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Willian Bogarin Jr on 2023. 09. 18..
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCirclo: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    // 1. RANDOM COORDINATE
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    // 2. RANDOM SIZE
    func randomSize() -> CGFloat {
         return CGFloat.random(in: 4...80)
    }
    
    // 3. RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 4. RANDOM SPEED
    func randomSpeed() -> Double  {
        return Double.random(in: 0.05...1.0)    }
    
    // 5. RANDOM DELAY
    func randomDelay() -> Double  {
        return Double.random(in: 0...2.0)
    }
    
    
    var body: some View {
        ZStack{
            
            ForEach(0...randomCirclo, id: \.self) {
                item in
           
            Circle()
                .foregroundColor(.white)
                .opacity(0.25)
                .frame(width: randomSize())
                .position(
                    x: randomCoordinate(),
                    y: randomCoordinate()
                )
                .scaleEffect(isAnimating ? randomScale() : 1)
                
                .onAppear(perform: {
                    withAnimation(
                        .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                        .repeatForever()
                        .speed(randomSpeed())
                        .delay(randomDelay())
                    ) {
                        isAnimating = true
                    }
                })
            }
        }//: ZSTACK
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        
        

            MotionAnimationView()
            .background(
            Circle()
                .fill(.teal)
            )
  
        
    }
}
