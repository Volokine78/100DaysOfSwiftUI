//
//  ContentView.swift
//  Fun Tables
//
//  Created by Tolga PIRTURK on 14.01.2022.
//

import SwiftUI

struct SettingsView: View {
    @State private var level = 2
    @State private var numberOfQuestions = 0
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        Stepper("Up to 12", value: $level, in: 2...12)
                        Text("Max Table Level is \(level)")
                    } header: {
                        Text("Choose Your Level")
                    }
                    
                    Section {
                        Picker("How many question", selection: $numberOfQuestions) {
                            ForEach(1..<5) {
                                Text("\($0 * 5)")
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("How many questions you want to be asked ?")
                    }
                }
                .listStyle(.grouped)
                
                NavigationLink("Start", destination: QuestionView(level: level, numberOfQuestions: numberOfQuestions))
                
                Spacer()
            }
            .navigationTitle("Fun Tables")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
