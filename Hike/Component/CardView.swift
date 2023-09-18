//
//  CardView.swift
//  Hike
//
//  Created by Willian Bogarin Jr on 2023. 09. 16..
//

import SwiftUI

struct CardView: View {
    //MARK: - PROPERTIES
    
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    //MARK: - FUNCTIONS
    
    func randomImage() {
        print("--- BUTTON WAS PRESSED ---")
        print("STATUS: Old image number = \(imageNumber)")
        
        repeat{
            randomNumber = Int.random(in: 1...5)
            print("ACTION: Random number Generated= \(randomNumber)")
        }while randomNumber == imageNumber
        
        
        imageNumber = randomNumber
        
        print("Result: New Image Number = \(imageNumber)")
        print("---- THE END ----")
        print("\n")
        
    }
    
    
    
    var body: some View {
        //MARK: - CARD
        
        ZStack {
            CustomBackgroundView()
            
            VStack {
                //MARK: - HEADER
                
                VStack (alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [
                                    .colorGrayLight,
                                    .colorGrayMedium]
                                               , startPoint: .top, endPoint: .bottom)
                                
                            )
                        
                        Spacer()
                        
                        Button {
                            // ACTION: Show a Sheet
                          
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet){
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }                    }
                    Text("Fun and Enjoyable outdoor ac†ivity for friends and family")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.colorGrayMedium)
                    
                }
                .padding(.horizontal,30)
                
                
                //MARK: - MAIN CONTENT
                
                ZStack {
 CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                //MARK: - FOOTER
                Button {
                    //ACTION: Generate a random number
                    randomImage()
                    
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [
                            .colorGreenLight,
                            .colorGreenMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                        )
                    )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
            }//: VSTACK
        } //: CARD
        
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
