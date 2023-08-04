//
//  ThirdView.swift
//  EsteeLauderChallenge
//
//  Created by Amulya on 7/27/23.
//

import SwiftUI

// View to display the card matching game
struct ThirdView: View {
    @State private var cards = [
        Card(imageName: "SoftCreme", matchingImageName: "SoftCremePic"),
        Card(imageName: "RadiantLotion", matchingImageName: "RadiantLotionPic"),
        Card(imageName: "2in1", matchingImageName: "2in1Pic"),
        Card(imageName: "AiryLotion", matchingImageName: "AiryLotionPic"),
        Card(imageName: "SoftCremePic", matchingImageName: "SoftCreme"),
        Card(imageName: "RadiantLotionPic", matchingImageName: "RadiantLotion"),
        Card(imageName: "2in1Pic", matchingImageName: "2in1"),
        Card(imageName: "AiryLotionPic", matchingImageName: "AiryLotion"),
        // Add more cards with different image names and texts
    ]
    init() {
            // Initialize highScore to Int.max when the view is created
            _highScore = State(initialValue: Int.max)
           }
    @State private var openedCardIndices = [Int]()
    @State private var matches = 0
    @State private var gridID = UUID()
    @State private var turns = 0
    @State private var highScore: Int? // Initialize highScore to nil
    @State private var showHighScore = false // variable to control when to show the high score
    @State private var completedGames = 0

    var body: some View {
        VStack {
            Text("Find the Matches")
                .font(.custom("Optima-Bold", size: 40))

            ZStack {
                CardGridView(cards: cards, openedCardIndices: $openedCardIndices, matches: $matches, turns: $turns)
                    .id(gridID) // Use the unique ID for the CardGridView

                if matches == 4 {
                    // Display the congratulations message in the middle of the screen
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 300, height: 200) // Adjust the size of the white rectangle
                            .border(.black, width: 1)
                            .cornerRadius(20)

                        VStack {
                            // Check if the new turns count beats the current highScore
                            if let currentHighScore = highScore, turns < currentHighScore {
                                Text("NEW HIGHSCORE!")
                                    .font(.custom("Optima-Bold", size: 25))
                                    .foregroundColor(Color.pink)
                                    .padding(.bottom, 1)
                            }
                            Text("Congratulations! You've matched all the cards in \(turns) turns!")
                                .multilineTextAlignment(.center)
                                .font(.custom("Verdana", size: 16))
                                .padding(.bottom, 5)

                            Button("PLAY AGAIN") {
                                resetGame()
                                completedGames += 1
                                showHighScore = true // Show the high score after the first game
                            }
                            .font(.custom("AvenirNextCondensed-Medium", size: 20))
                            .accentColor(.black)
                            .padding(10)
                            .background(Color(red: 255/255.0, green: 216/255.0, blue: 234/255.0))
                            .cornerRadius(8)
                        }
                        .frame(width: 280) // Limit the width of the VStack to fit inside the white rectangle
                    }
                }
            }

            // Display the turns counter and highScore only when it's not the first game
            HStack {
                Spacer()
                Text("TURNS: \(turns)")
                    .font(.custom("AvenirNextCondensed-Medium", size: 25))
                Spacer()

                Text(showHighScore ? "HIGHSCORE: \(highScore ?? turns)" : "HIGHSCORE: ???")
                    .font(.custom("AvenirNextCondensed-Medium", size: 25))
                Spacer()
            }
            .padding()
        }
        .onAppear {
            resetGame()
        }
    }

    private func resetGame() {
        // Initialize the colors and shuffle the cards
        initializeColors()
        shuffleCards()

        // Reset the game state when starting a new game
        cards.indices.forEach { index in
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        openedCardIndices.removeAll()
        matches = 0

        // Update highScore if the current turns count is lower
        if highScore == nil || (turns > 0 && turns < highScore!) {
            highScore = turns
        }

        turns = 0 // Reset the turns counter when playing again
        gridID = UUID() // Change the unique ID to trigger the update of CardGridView
        showHighScore = completedGames > 0 // Show the high score after the second game
    }

    private func shuffleCards() {
        cards.shuffle()
    }

    private func initializeColors() {
        var randomColors: [Color] = [
            Color(red: 222/255.0, green: 48/255.0, blue: 68/255.0),
            Color(red: 240/255.0, green: 82/255.0, blue: 97/255.0),
            Color(red: 244/255.0, green: 135/255.0, blue: 152/255.0),
            Color(red: 251/255.0, green: 200/255.0, blue: 207/255.0),
            Color(red: 244/255.0, green: 114/255.0, blue: 126/255.0),
            Color(red: 233/255.0, green: 59/255.0, blue: 84/255.0),
            Color(red: 244/255.0, green: 149/255.0, blue: 173/255.0),
            Color(red: 245/255.0, green: 175/255.0, blue: 184/255.0),
        ]
        
        // Shuffle the array to randomize colors
        randomColors.shuffle()
        
        // Assign colors to cards in order
        for (index, color) in randomColors.enumerated() {
            cards[index].color = color
        }
    }
}

struct Card: Identifiable, Equatable {
    let id = UUID()
    var isFaceUp = false
    var isMatched = false
    var imageName: String
    var matchingImageName: String
    var color: Color = .pink
}

// View for each card
struct CardView: View {
    @Binding var card: Card

    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(8)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(card.color)
            }
        }
    }
}

struct CardGridView: View {
    let columns: Int = 2 // Two columns for a 2x4 grid
    let cardWidth: CGFloat = 140
    let cardHeight: CGFloat = 140

    @State var cards: [Card]
    @Binding var openedCardIndices: [Int]
    @Binding var matches: Int // Receive matches as a binding
    @Binding var turns: Int // Receive turns as a binding

    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: columns)) {
            ForEach(cards.indices, id: \.self) { index in
                CardView(card: $cards[index])
                    .frame(width: cardWidth, height: cardHeight)
                    .onTapGesture {
                        if !cards[index].isFaceUp && openedCardIndices.count < 2 {
                            cards[index].isFaceUp = true
                            openedCardIndices.append(index)

                            if openedCardIndices.count == 2 {
                                checkForMatch()
                            }
                        }
                    }
            }
        }
    }
    
    // Function to check for matching cards
    func checkForMatch() {
        let index1 = openedCardIndices[0]
        let index2 = openedCardIndices[1]

        let imageName1 = cards[index1].imageName
        let imageName2 = cards[index2].imageName

        // Check if both cards match each other
        if imageName1 == cards[index2].matchingImageName && imageName2 == cards[index1].matchingImageName {
            matches += 1
            print("Match Found! Total Matches: \(matches)")
            cards[index1].isMatched = true
            cards[index2].isMatched = true
        } else {
            print("No Match!")
            // Delay card flipping back if they don't match
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                cards[index1].isFaceUp = false
                cards[index2].isFaceUp = false
            }
        }

        openedCardIndices.removeAll()

        // Increment the turns counter
        turns += 1
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}

