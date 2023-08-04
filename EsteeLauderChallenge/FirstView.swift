//
//  FirstView.swift
//  EsteeLauderChallenge
//
//  Created by Amulya on 7/27/23.
//

import SwiftUI
import AVKit

struct FirstView: View {
    // Video file name and extension
    let videoFileName = "SP23_Nutritious_Hero_Campaign_Hero_Film_30s_1920x1080_Sound_Super_GLOBAL_COMP"
    let videoFileExtension = "mp4"
    
    var body: some View {
        VStack {
            Text("New Nutritious Line")
                .font(.custom("Optima-Bold", size: 40))
            
            // Video Player
            if let videoURL = Bundle.main.url(forResource: videoFileName, withExtension: videoFileExtension) {
                VideoPlayer(player: AVPlayer(url: videoURL))
                    .frame(width: 347, height: 195)
                    .padding(.bottom)
            } else {
                Text("Video file not found!") // Show error message if video file is missing
            }
            
            Text("NUTRIGENOMICS")
                .font(.custom("AvenirNextCondensed-Medium", size: 30))
                .padding(5)
                .background(Color(red: 240/255.0, green: 96/255.0, blue: 114/255.0))
                .padding(.bottom, 1)
            
            Text("Where nutrition and skin science intersect. Harness the power of nutrient diversity to unburden/re-balance the look of grumpy skin.")
                .font(.custom("Verdana", size: 15))
                .padding(.bottom, 10)
            
            Text("SKIN-LOVING, FUTURE-LOVING")
                .font(.custom("AvenirNextCondensed-Medium", size: 30))
                .padding(5)
                .background(Color(red: 244/255, green: 141/255, blue: 156/255))
                .padding(.bottom, 1)
            
            Text("92%+ naturally derived formulas. Thoughtfully formulated. EWG verified. Nutritious is dedicated to a cleaner, more beautiful way of living. Where you and your skin can always find a happy place. It's that simple.")
                .font(.custom("Verdana", size: 15))
                .padding(.bottom, 10)
            
            Text("PEAK PERFORMANCE SKINCARE")
                .font(.custom("AvenirNextCondensed-Medium", size: 30))
                .padding(5)
                .background(Color(red: 248/255.0, green: 186/255.0, blue: 197/255.0))
                .padding(.bottom, 1)
            
            Text("Oil reducer. Pore minimizer. Redness fighter. The Nutritious Collection is everything skin craves for a blissful, healthy look.")
                .font(.custom("Verdana", size: 15))
            
            Spacer() // Add space at the bottom
        }
        .padding(.horizontal) // Add horizontal padding
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
