//
//  SecondView.swift
//  EsteeLauderChallenge
//
//  Created by Amulya on 7/27/23.
//

import SwiftUI

struct SecondView: View {
    // State variables to track selected index for each carousel
    @State private var selectedIndex1 = 0
    @State private var selectedIndex2 = 0
    @State private var selectedIndex3 = 0
    @State private var selectedIndex4 = 0

    // Image arrays for each carousel
    let imagesCarousel1 = ["2in1Green", "2in1Word1", "2in1(1)", "2in1Plain1", "2in1Diagram", "2in1(2)", "2in1Word2"]
    let imagesCarousel2 = ["SCGreen", "SCWord1", "SC1", "SCPlain1", "SCDiagram", "SCWord2"]
    let imagesCarousel3 = ["RLGreen", "RLWord1", "RL1", "RLPlain1", "RLDiagram", "RL2", "RLWord2"]
    let imagesCarousel4 = ["ALGreen", "ALWord1", "AL1", "ALPlain1", "ALDiagram", "AL2", "ALWord2"]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Explore the Products")
                    .font(.custom("Optima-Bold", size: 39))
                    .padding(.bottom, 10)
                
                // Carousel 1
                carouselView(title: "2 IN 1 FOAM CLEANSER", subtitle: "Say goodbye to excess shine with dual-action. New Nutritious 2-in-1 Foam Cleanser. Gently cleanses and deeply purifies.", images: imagesCarousel1, selectedIndex: $selectedIndex1)
                    .padding(.bottom, 15)
                
                // Carousel 2
                carouselView(title: "MELTING SOFT CREME/MASK", subtitle: "Say goodbye to dry skin with pillowy-soft New Nutritious Melting Soft Creme/Mask. Quenches with soothing hydration. Calms. Renews. Strengthens.", images: imagesCarousel2, selectedIndex: $selectedIndex2)
                    .padding(.bottom, 15)
                
                // Carousel 3
                carouselView(title: "RADIANT ESSENCE LOTION", subtitle: "Keep calm and glow on. Help reduce visible redness with New Nutritious Radiant Essence Lotion. Awakens, balances and calms.", images: imagesCarousel3, selectedIndex: $selectedIndex3)
                    .padding(.bottom, 15)
                
                // Carousel 4
                carouselView(title: "AIRY LOTION", subtitle: "Dive in and drink up. Get light and airy skin with New Nutritious Airy Lotion. Bright, fresh, glowing skin.", images: imagesCarousel4, selectedIndex: $selectedIndex4)
                Spacer()
            }
            .padding(.horizontal)
        }
    }

    // Function to create a carousel view
    private func carouselView(title: String, subtitle: String, images: [String], selectedIndex: Binding<Int>) -> some View {
        VStack {
            Text(title)
                .font(.custom("AvenirNextCondensed-Medium", size: 30))
                .padding(5)
                .background(Color(red: 255/255.0, green: 216/255.0, blue: 234/255.0))
            
            Text(subtitle)
                .font(.custom("Verdana", size: 15))
                .multilineTextAlignment(.center)

            HStack {
                // Left arrow button to navigate to the previous image
                Button(action: {
                    if selectedIndex.wrappedValue > 0 {
                        selectedIndex.wrappedValue -= 1
                    } else {
                        // Wrap around to the last image when the first image is clicked
                        selectedIndex.wrappedValue = images.count - 1
                    }
                }) {
                    Image(systemName: "chevron.left.circle")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                .padding(.trailing, 10)

                TabView(selection: selectedIndex) {
                    ForEach(0..<images.count, id: \.self) { index in
                        Image(images[index])
                            .resizable()
                            .scaledToFit()
                            .tag(index) // Set the tag to identify each image in the TabView
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 150)

                // Right arrow button to navigate to the next image
                Button(action: {
                    if selectedIndex.wrappedValue < images.count - 1 {
                        selectedIndex.wrappedValue += 1
                    } else {
                        // Wrap around to the first image when the last image is clicked
                        selectedIndex.wrappedValue = 0
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                .padding(.leading, 10)
            }
            .padding(.horizontal, 10)

            // Page indicators (dots)
            HStack(spacing: 10) {
                ForEach(0..<images.count, id: \.self) { index in
                    Circle()
                        .foregroundColor(selectedIndex.wrappedValue == index ? .black : .gray)
                        .frame(width: 10, height: 10)
                        .scaleEffect(selectedIndex.wrappedValue == index ? 1.5 : 1.0) // Adjust the scale of the selected dot
                        .animation(.spring())
                }
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
