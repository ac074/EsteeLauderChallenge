//
//  FourthView.swift
//  EsteeLauderChallenge
//
//  Created by Amulya on 7/28/23.
//

import SwiftUI

struct FourthView: View {
    // Start with the quiz home page
    @State private var questionCounter = 0
    
    // Three elements for the three products
    @State private var points: [Int] = [0, 0, 0]
    
    var body: some View {
            VStack {
                
                // Display question number for questions 1 to 5
                if questionCounter > 0 && questionCounter <= 5 {
                    Text("Question \(questionCounter):")
                        .font(.custom("Optima-Bold", size: 40))
                        .padding()
                        .border(Color.black, width: 5)
                        .padding(.bottom)
                }
                
                // Switch based on the current question counter to display the appropriate view
                switch questionCounter {
                    
                // Home page with introductory text and button to start the quiz
                case 0:
                    InitialView(questionCounter: $questionCounter)
                    
                // Display questions with options
                case 1...5:
                    QuestionView(title: getQuestionTitle(for: questionCounter), options: getQuestionOptions(for: questionCounter), questionCounter: $questionCounter, points: $points)
                
                // Result view displaying the recommended product and related information
                case 6:
                    VStack {
                        let (highestProduct, middleProduct, lowestProduct) = getTopThreeProducts()
                        
                        ResultView(highestProduct: highestProduct, productDescription: getProductDescription(for: highestProduct), imageName: getImageName(for: highestProduct), getRating: getRating, middleProduct: middleProduct, lowestProduct: lowestProduct, questionCounter: $questionCounter, points: $points)
                    }
                default:
                    Text("")
            }
        }
    }
    
    // Get the question title based on the question counter
    func getQuestionTitle(for questionCounter: Int) -> String {
        switch questionCounter {
        case 1:
            return "Which best fits your price range?"
        case 2:
            return "Which three words seem the most appealing to you?"
        case 3:
            return "Do you want a product for...?"
        case 4:
            return "How natural of a product do you want?"
        case 5:
            return "Which type of product are you looking for?"
        default:
            return ""
        }
    }
    
    // Get the question options based on the question counter
    func getQuestionOptions(for questionCounter: Int) -> [String] {
        switch questionCounter {
        case 1:
            return ["Under $30", "Between $30 to $45", "Above $45"]
        case 2:
            return ["Purify. Pores. Glow", "Prep. Infuse. Glow.", "Pores. Hydration. Glow."]
        case 3:
            return ["Daily cleansing and deep purifying", "Redness and dullness", "Dryness and dehydration"]
        case 4:
            return ["97% naturally derived formula", "95% naturally derived formula", "93% naturally derived formula"]
        case 5:
            return ["Cleanser", "Lotion", "Creme"]
        default:
            return []
        }
    }
    
    // Get the appropriate image for each product
    func getImageName(for product: String) -> Image {
        switch product {
        case "Cleanser":
            return Image("2in1Pic")
        case "Lotion":
            return Image("RadiantLotionPic")
        case "Creme":
            return Image("SoftCremePic")
        default:
            return Image(systemName: "questionmark.circle.fill")
        }
    }
    
    // Get the star rating view for each product
    func getRating(for product: String) -> AnyView {
        switch product {
        case "Cleanser":
            return AnyView(
                HStack{
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star")
                }
                    .padding(.bottom, 5)
            )
        case "Lotion":
            return AnyView(
                HStack{
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star")
                    Image(systemName: "star")
                }
                    .padding(.bottom, 5)
            )
        case "Creme":
            return AnyView(
                HStack{
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.leadinghalf.fill")
                }
                    .padding(.bottom, 5)
            )
        default:
            return AnyView(EmptyView())
        }
    }
    
    // Get the product description text for each product
    func getProductDescription(for product: String) -> Text {
        switch product {
        case "Cleanser":
            return Text("2-in-1 Foam Cleanser works as a daily cleanser or weekly purifying mask.")
        case "Lotion":
            return Text("Radiant Essence Lotion delivers a cushioning, hydrating infusion. ")
        case "Creme":
            return Text("Melting Soft Creme/Mask melts into skin. Comfortable, cushy, pillowy feel. ").font(.custom("Verdana", size: 17))
        default:
            return Text("")
        }
    }
    
    // Get the top three recommended products based on the points accumulated
    func getTopThreeProducts() -> (String, String, String) {
        var productsWithPoints: [ProductWithPoints] = [
            ProductWithPoints(product: "Cleanser", points: points[0]),
            ProductWithPoints(product: "Lotion", points: points[1]),
            ProductWithPoints(product: "Creme", points: points[2])
        ]
        
        // Sort the products in descending order based on points
        productsWithPoints.sort(by: { $0.points > $1.points })
        
        let highestProduct = productsWithPoints[0].product
        let middleProduct = productsWithPoints[1].product
        let lowestProduct = productsWithPoints[2].product
        
        return (highestProduct, middleProduct, lowestProduct)
    }
}

// Struct to hold product name and points
struct ProductWithPoints {
    let product: String
    let points: Int
}

// View for the quiz home page
struct InitialView: View {
    @Binding var questionCounter: Int

    var body: some View {
        VStack {
            Text("Find YOUR Match!")
                .font(.custom("Optima-Bold", size: 40))
                .padding(.bottom, 15)
            Text("If your skin is grumpy, dull and irritable, this collection is what you need. Skincare that will help skin flourish and flaunt its natural vibrancy. But...")
                .font(.custom("Verdana", size: 17))
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            Text("Which product is the right fit for YOU?")
                .font(.custom("AvenirNextCondensed-Medium", size: 26))
                .padding(5)
            Image("AllPics")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal)
                .padding(.vertical,15)
            Button(action: {
                // Increment the question counter on button click
                questionCounter += 1
            }) {
                Text("CLICK HERE TO FIND OUT...")
                    .font(.custom("AvenirNextCondensed-Medium", size: 18))
                    .foregroundColor(.black)
                    .padding()
                    .background(Color(red: 255/255.0, green: 216/255.0, blue: 234/255.0))
            }
        }
        Spacer()
    }
}

// View to display questions with options and record user selections
struct QuestionView: View {
    let title: String
    let options: [String]
    @Binding var questionCounter: Int
    @Binding var points: [Int]

    var body: some View {
        VStack {
            VStack {
                Text(title)
                    .font(.custom("Verdana-Bold", size: 25))
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                    .padding(.horizontal, 10)

                ForEach(0..<3) { index in
                    Button(action: {
                        // Accumulate points for each product based on user's selection
                        switch index {
                        case 0:
                            points[0] += 1 // Cleanser
                        case 1:
                            points[1] += 1 // Lotion
                        case 2:
                            points[2] += 1 // Creme
                        default:
                            break
                        }

                        if questionCounter < 5 {
                            // Move to the next question
                            questionCounter += 1
                        } else {
                            // Move to the result view
                            questionCounter = 6
                        }
                    }) {
                        Text((options[index]).uppercased())
                            .font(.custom("AvenirNextCondensed-Regular", size: 30))
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .foregroundColor(.black)
                            .background(getButtonColor(for: options[index]))
                            .cornerRadius(10)
                    }
                    .padding(4)
                }
            }
        }
    }
    
    // Get the button color based on the option selected
    func getButtonColor(for option: String) -> Color {
        switch option {
        case "Under $30", "Purify. Pores. Glow", "Daily cleansing and deep purifying", "97% naturally derived formula", "Cleanser":
            return Color(red: 240/255.0, green: 96/255.0, blue: 114/255.0)
        case "Between $30 to $45", "Prep. Infuse. Glow.", "Redness and dullness","95% naturally derived formula", "Lotion":
            return (Color(red: 244/255, green: 141/255, blue: 156/255))
        case "Above $45", "Pores. Hydration. Glow.", "Dryness and dehydration", "93% naturally derived formula", "Creme":
            return Color(red: 248/255.0, green: 186/255.0, blue: 197/255.0)
        default:
            return Color.gray
        }
    }
}

// View to display the result with the highest recommended product
struct ResultView: View {
    let highestProduct: String
    let productDescription: Text
    let imageName: Image
    let getRating: (String) -> AnyView
    let middleProduct: String
    let lowestProduct: String
    @Binding var questionCounter: Int
    @Binding var points: [Int]
    @State private var selectedIndex = 0
    let imagesCarousel = ["shop2", "shopAll1", "shopLotion", "shop1", "shopAll2", "shopLotionCreme"]
    let carouselTimer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()

    var body: some View {
        ScrollView {
            VStack {
                Text("The #1 recommended product for YOU is...")
                    .font(.custom("Optima-Bold", size: 34))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5)
                    .padding(.horizontal)
                    .fontWeight(.bold)

                HStack {
                    VStack {
                        imageName
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                    VStack {
                        Text(highestProduct.uppercased())
                            .font(.custom("AvenirNextCondensed-Medium", size: 30))
                            .foregroundColor(Color(red: 221/255.0, green: 44/255.0, blue: 64/255.0))
                            .padding(.horizontal, 5)
                            .padding(.bottom, 2)
                        getRating(highestProduct)
                        productDescription
                            .font(.custom("Verdana", size: 16))
                            .padding(.bottom, 5)
                        Button(action: {

                            // Reset points and question counter
                            points = [0, 0, 0]

                            // Reset to 1 to show the first question again
                            questionCounter = 1
                        }) {
                            Text("Retake Quiz")
                                .font(.custom("AvenirNextCondensed-Medium", size: 20))
                                .accentColor(.black)
                                .padding(.horizontal, 7)
                                .padding(.vertical, 3)
                                .background(Color(red: 244/255, green: 141/255, blue: 156/255))
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.vertical, 10)

                HStack {
                    Spacer()
                    Text("#2: ")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(middleProduct.uppercased())
                        .font(.custom("AvenirNextCondensed-Medium", size: 25))
                    Spacer()
                    Text("#3: ")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(lowestProduct.uppercased())
                        .font(.custom("AvenirNextCondensed-Medium", size: 25))
                    Spacer()
                }
                .padding(.vertical, 5)
                Text("Click the button below to shop directly from the Estee Lauder website and view all their amazing products...")
                    .multilineTextAlignment(.center)
                    .font(.custom("Verdana", size: 18))
                    .padding(5)
                    .background(Color(red: 248/255.0, green: 186/255.0, blue: 197/255.0))
                Link("SHOP NOW!", destination: URL(string: "https://www.esteelauder.com/products/26393/product-catalog/skin-care/skin-care-collections/nutritious")!)
                    .foregroundColor(.black)
                    .font(.custom("AvenirNextCondensed-Bold", size: 20))
                    .padding(.top, 15)
                VStack {
                    TabView(selection: $selectedIndex) {
                        ForEach(0..<imagesCarousel.count, id: \.self) { index in
                            Image(imagesCarousel[index])
                                .resizable()
                                .scaledToFit()
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(height: 150)
                    .padding(.horizontal)
                    .onReceive(carouselTimer) { _ in
                        selectedIndex = (selectedIndex + 1) % imagesCarousel.count
                    }

                    // Image indicators - dots
                    HStack(spacing: 10) {
                        ForEach(0..<imagesCarousel.count, id: \.self) { index in
                            Circle()
                                .foregroundColor(selectedIndex == index ? .black : .gray)
                                .frame(width: 10, height: 10)
                                .scaleEffect(selectedIndex == index ? 1.5 : 1.0)
                                .animation(.spring())
                        }
                    }
                }

            }
            .padding(.horizontal)
        }
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}
