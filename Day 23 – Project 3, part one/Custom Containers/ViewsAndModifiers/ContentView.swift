//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Tolga PIRTURK on 27.12.2021.
//

import SwiftUI

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(15)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .modifier(Title())
            
            Text("Salve, mundi!")
                .titleStyle()
            
            Color.red
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking with Swift")
            
            Color.green
                .frame(width: 300, height: 200)
                .modifier(Watermark(text: "Hacking with Swift"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
