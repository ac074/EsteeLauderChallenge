//
//  ContentView.swift
//  EsteeLauderChallenge
//
//  Created by Amulya on 7/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var showSixthView = true // Control the visibility of SeventhView

    var body: some View {
        ZStack {
            // ContentView with navigation bar
            NavigationView {
                TabView(selection: $selectedTab) {
                    FirstView()
                        .tabItem {
                            Image(systemName: "house.fill")
                                .foregroundColor(Color.pink)
                            VStack {
                                Text("Home")
                            }
                        }
                        .tag(0)
                    SecondView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            VStack {
                                Text("Products")
                            }
                        }
                        .tag(1)
                    ThirdView()
                        .tabItem {
                            Image(systemName: "square.fill.on.square.fill")
                            Text("Match")
                        }
                        .tag(2)
                    FourthView()
                        .tabItem {
                            Image(systemName: "questionmark")
                            Text("Quiz")
                        }
                        .tag(3)
                    FifthView()
                        .tabItem {
                            Image(systemName: "ellipsis.message")
                            Text("Reviews")
                        }
                        .tag(4)
                }
                .navigationBarHidden(true) // Hide the navigation bar in ContentView
            }
            .opacity(showSixthView ? 0.0 : 1.0) // Hide ContentView when showing SeventhView

            // SeventhView without navigation bar
            if showSixthView {
                SixthView()
                    .transition(.opacity)
                    // Set a delay and then hide SeventhView after 10 seconds
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                            withAnimation {
                                showSixthView = false // Hide SixthView after 10 seconds
                            }
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
