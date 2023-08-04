//
//  SixthView.swift
//  EsteeLauderChallenge
//
//  Created by Amulya on 8/1/23.
//

import SwiftUI

struct SixthView: View {
    // Array to store opacity values for each image
    @State private var opacity: [Double] = Array(repeating: 0.0, count: 15)

    var body: some View {
        VStack {
            // Grouping images in HStacks to display them in rows
            HStack {
                Image("pink")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[0])
                Image("2in1")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[1])
                Image("pink")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[2])
            }
            HStack {
                Image("RadiantLotionPic")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[3])
                Image("pink")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[4])
                Image("AiryLotionPic")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[5])
            }
            HStack {
                Image("pink")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[0])
                Image("SoftCreme")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[1])
                Image("pink")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[2])
            }
            
            // Displaying the logo image in the middle of the screen
            Image("logo 1")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)

            HStack {
                Image("pink")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[6])
                Image("2in1Pic")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[7])
                Image("pink")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[8])
            }
            HStack {
                Image("RadiantLotion")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[9])
                Image("pink")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[10])
                Image("AiryLotion")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[11])
            }
            HStack {
                Image("pink")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[12])
                Image("SoftCremePic")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[13])
                Image("pink")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity[14])
            }
        }
        .padding(.horizontal)
        .onAppear {
            // Generate an array of random delays
            let randomDelays = Array(0..<15).shuffled().map { Double($0) * 0.5 }

            // Set the delays for each image to fade in
            for (index, delay) in randomDelays.enumerated() {
                withAnimation(.easeIn(duration: 1.0).delay(delay)) {
                    opacity[index] = 1.0
                }
            }
        }
    }
}

struct SixthView_Previews: PreviewProvider {
    static var previews: some View {
        SixthView()
    }
}
