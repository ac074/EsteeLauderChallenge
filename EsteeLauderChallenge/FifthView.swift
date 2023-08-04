//
//  FifthView.swift
//  EsteeLauderChallenge
//
//  Created by Amulya on 8/1/23.
//

import SwiftUI

// Model class for representing customer review data
class ReviewModel: Identifiable {
    var name: String
    var location: String
    var title: String
    var body: String
    var date: String
    let id = UUID()

    init(name: String, location: String, title: String, body: String, date: String) {
        self.name = name
        self.location = location
        self.title = title
        self.body = body
        self.date = date
    }
}

// View to display customer reviews
struct FifthView: View {
    
    // Array of ReviewModel instances representing customer reviews
    @State private var cards: [ReviewModel] = [
        ReviewModel(name: "MANDA", location: "HUNTINGTON BEACH, CA", title: "MELTY DREAMY", body: "Felt so nice on my skin", date: "July 27, 2023"),
        ReviewModel(name: "KK1996", location: "TERRYVILLE, CT", title: "GOOD", body: "Came in cute packaging. Made my dry skin super soft! I totally recommend", date: "July 26, 2023"),
        ReviewModel(name: "CHULA901", location: "MEMPHIS, TN", title: "LOVE IT", body: "Love it, it makes your skin soft and smooth. It moisturizer your face.", date: "July 21, 2023"),
        ReviewModel(name: "BLOOM", location: "FORT WORTH, TX", title: "GREAT CREME/ MASK", body: "I really like this creme. It is very appealing", date: "July 16, 2023"),
        ReviewModel(name: "GIGI506", location: "PORTLAND, OR", title: "EXCELLENT CLEANSER", body: "I really liked the Nutritious 2-in-1 Foam Cleanser. It was effective without being too drying!", date: "July 16, 2023"),
        ReviewModel(name: "SARAHDEE12", location: "ALEXANDRIA, VA", title: "SUPER CLEANSER", body: "Lightweight foam cleanser with a deep cleaning effect", date: "July 15, 2023"),
        ReviewModel(name: "SARAHDEE12", location: "ALEXANDRIA, VA", title: "LUXURIOUS MASK", body: "Mask is refreshing and moisturizing, leaving my skin feeling nice and clean", date: "July 15, 2023"),
        ReviewModel(name: "ABBYROSE0195", location: "LANCASTER, PA", title: "AMAZING", body: "This was such a soft and supple moisturizer! It helped my skin feel very smooth and even some lines diminished!", date: "July 13, 2023"),
        ReviewModel(name: "AB_HA1", location: "ATOKA, TN", title: "NICE", body: "This left my skin very soft! I like it and I might get some for my mom!", date: "July 12, 2023"),
        ReviewModel(name: "HEATHERGIRLLLL", location: "COLUMBUS, OH", title: "DREAM HYDRATION", body: "This product was so hydrating and creamy. I loved the light scent and smooth consistency! I would love a full size of the product.", date: "July 03, 2023"),
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                Text("See reviews from satisfied customers!")
                    .font(.custom("Optima-Bold", size: 40))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                // Loop through each ReviewModel in the cards array and display its information
                ForEach(cards) { card in
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            
                            // 5 stars for every review
                            HStack {
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                    .frame(width: 20)
                            }
                            .padding(.bottom, 2)
                            
                            Text("\(card.title)")
                                .font(.custom("NotoSansOriya-Bold", size: 16))
                                .padding(.bottom, 3)
                            
                            Text("\(card.body)")
                                .font(.custom("Verdana", size: 15))
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            
                            Text(card.date)
                                .fontWeight(.semibold)
                            
                            Text("\(card.name)")
                                .font(.custom("AvenirNextCondensed-Bold", size: 16))
                                .padding(.bottom, 3)
                                .padding(.vertical, 1)
                            
                            Text("\(card.location)")
                                .font(.custom("EuphemiaUCAS", size: 16.5))
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    Divider()
                }
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}
struct FifthView_Previews: PreviewProvider {
    static var previews: some View {
        FifthView()
    }
}
