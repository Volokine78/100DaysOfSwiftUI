//
//  ContentView.swift
//  iExpense
//
//  Created by Tolga PIRTURK on 19.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "tapCount")
    @AppStorage("tapCount1") private var tapCount1 = 0
    
    var body: some View {
        VStack(spacing: 50) {
            Button("Tap Count: \(tapCount)") {
                tapCount += 1
                UserDefaults.standard.set(tapCount, forKey: "tapCount")
            }
            
            Button("Tap Count 2: \(tapCount1)") {
                tapCount1 += 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
