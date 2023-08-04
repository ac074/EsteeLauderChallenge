//
//  EighthView.swift
//  EsteeLauderChallenge
//
//  Created by Amulya on 8/2/23.
//

import SwiftUI
/*
 Color(red: 233/255.0, green: 59/255.0, blue: 84/255.0), Color(red: 236.5/255.0, green: 70.5/255.0, blue: 90.5/255.0), Color(red: 242/255, green: 98/255, blue: 111.5/255),
 Color(red: 244/255.0, green: 114/255.0, blue: 126/255.0), Color(red: 244/255, green: 124.5/255, blue: 139/255), Color(red: 244/255.0, green: 140/255.0, blue: 153/255.0),
 Color(red: 244.5/255, green: 155/255, blue: 168/255), Color(red: 248/255.0, green: 178/255.0, blue: 188/255.0), Color(red: 251/255.0, green: 200/255.0, blue: 207/255.0)
 */
struct EighthView: View {
    init() {
            for family: String in UIFont.familyNames {
                print(family)
                for names: String in UIFont.fontNames(forFamilyName: family) {
                    print("== \(names)")
                }
            }
        }
    var body: some View {
        VStack{
            Text("Hello World")
                .font(.custom("TamilSangamMN-Bold", size: 30))
            Text("HAPPINESS")
                .font(.custom("EuphemiaUCAS", size: 30))
            Text("Hello World afh;nfa uhuf ouhfoa ohgfh ;oiirfn ;iehnf ifhf ;iohfh iowhfouh woruhgw ouhgf uohw ")
                .font(.custom("Optima-Regular", size: 15))
            Text("HELLO WORLD")
                .font(.custom("Thonburi-Light", size: 30))
            Text("Hello World")
                .font(.custom("PingFangTC-Light", size: 20))
        }
    }
}
struct EighthView_Previews: PreviewProvider {
    static var previews: some View {
        EighthView()
    }
}
