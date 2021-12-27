//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Tolga PIRTURK on 27.12.2021.
//

import SwiftUI

struct ContentView: View {
    var motto1: some View {
        Text("Draco dormiens")
    }
    
    let motto2 = Text("nunquam titillandus")
    
    var spells: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    @ViewBuilder var spells2: some View {
            Text("Lumos")
            Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            spells
            spells2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
