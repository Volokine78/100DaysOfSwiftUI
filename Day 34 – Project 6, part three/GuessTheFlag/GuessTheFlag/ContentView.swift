//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Tolga PIRTURK on 26.12.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var flagTapped = false
    @State private var scoreTitle = ""
    @State private var alertButtonTitle = ""
    @State private var score = 0
    @State private var gameCounter = 0
    @State private var isAnimated = false
    @State private var selectedNumber = 0
    @State private var animationAmount = 0.0
    @State private var selectedAction: () -> Void = { }
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            withAnimation {
                                flagTapped(number)
                            }
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                                .rotation3DEffect(
                                    .degrees(isAnimated && selectedNumber == number ? 360 : 0),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                                .opacity(isAnimated && selectedNumber != number ? 0.25 : 1)
                                .scaleEffect(isAnimated && selectedNumber != number ? 0.75 : 1)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .animation(.easeOut(duration: 0.2), value: animationAmount)
                
                Spacer()
                Spacer()
                
                Text("Score \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $flagTapped) {
            Button(alertButtonTitle, action: selectedAction)
        } message: {
            Text("\(gameCounter)/8 round!\nYour score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        selectedNumber = number
        isAnimated = true
        gameCounter += 1
        selectedAction = askQuestion
        alertButtonTitle = "Continue"

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            flagTapped = true
        }

        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 10
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            if score != 0 {
                score -= 5
            }
        }
        
        if gameCounter == 8 {
            scoreTitle = "You've finished the game!"
            if score == 80 {
                scoreTitle = "Perfect!"
                score += 20
            }
            selectedAction = reset
            alertButtonTitle = "Restart"
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        isAnimated = false
        animationAmount += 1
    }
    
    func reset() {
        askQuestion()
        score = 0
        gameCounter = 0
        isAnimated = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
