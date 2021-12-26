//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Tolga PIRTURK on 26.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button {
                print("Button was tapped!")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundColor(.white)
                    .background(.red)
            }
            
            Image(systemName: "pencil")
            
            Button {
                print("Edit button was tapped!")
            } label: {
                Image(systemName: "pencil")
            }
            
            Button {
                print("Edit button was tapped!")
            } label: {
                Label("Edit", systemImage: "pencil")
            }
        }
    }
    
    func executeDelete() {
        print("Now deleting")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
