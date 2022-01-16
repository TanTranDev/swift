//
//  ContentView.swift
//  pop_aqua
//
//  Created by Tran Nhat Tan on 16/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State var value  = 0
    @State var imageData = "aqua1"
    func incrementTap() {
        value += 1
        if imageData == "aqua1" {
            imageData = "aqua2"
        } else {
            imageData = "aqua1"
        }
    }
    var body: some View {
        Color(hex: 0xe2a0a0).edgesIgnoringSafeArea(.all).overlay(
    VStack(alignment: .center) {
        Spacer()
        Text(String(value)).font(.system(size: 64, weight: .bold, design: .rounded)).foregroundColor(Color.white)
        Spacer()
        Image(imageData).resizable().padding(.horizontal, 16.0).scaledToFit()
    }.edgesIgnoringSafeArea(.bottom).onTapGesture {
        self.incrementTap()
    }

        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
