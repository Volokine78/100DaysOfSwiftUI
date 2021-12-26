//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Tolga PIRTURK on 26.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(stops: [
                .init(color: .white, location: 0.45),
                .init(color: .blue, location: 0.55)
            ]), startPoint: .top, endPoint: .bottom)
            
            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
            
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
