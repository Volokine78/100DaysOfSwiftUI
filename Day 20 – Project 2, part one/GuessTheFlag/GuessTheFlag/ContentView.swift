//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Tolga PIRTURK on 26.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Rectangle()
                    .fill(Color.blue)
                Rectangle()
                    .fill(Color.blue)
                Rectangle()
                    .fill(Color.blue)
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            
            HStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.green)
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.green)
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.green)
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            
            HStack {
                Capsule()
                    .fill(Color.red)
                Capsule()
                    .fill(Color.red)
                Capsule()
                    .fill(Color.red)
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
