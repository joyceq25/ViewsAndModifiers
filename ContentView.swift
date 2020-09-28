//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Ping Yun on 9/27/20.
//

import SwiftUI

//custom modifier that can be applied to a view
struct Title: ViewModifier { 
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
//wraps Title modifier in extension so it can be called with .titleStyle
extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

//custom modifier that creates new view structure
struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}
//extension of Watermark modifier so it can be called with .watermarked
extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    var body: some View {
        Color.blue
            .frame(width: 300, height: 200) //blue rectangle with 300 width and 200 height
            .watermarked(with: "Hacking with Swift") //adds watermark to corner of rectangle 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
