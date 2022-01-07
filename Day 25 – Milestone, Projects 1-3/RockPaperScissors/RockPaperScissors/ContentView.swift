//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Tolga PIRTURK on 7.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var gameStateTitle = "Win"
    @State private var score = 0
    @State private var gameCounter = 0
    @State private var gameFinished = false
    
    @State private var appMoves = ["Rock", "Paper", "Scissors"]
    @State private var winningMoves = ["Paper", "Scissors", "Rock"]
    @State private var losingMoves = ["Scissors", "Rock", "Paper"]
    @State private var playerMoves = ["Rock", "Paper", "Scissors"].shuffled()
    @State private var move = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.25, green: 0.2, blue: 0.55), location: 0.3),
                .init(color: Color(red: 0.8, green: 0.38, blue: 0.26), location: 0.3)], center: .center, startRadius: 250, endRadius: 650)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Rock, Paper, Scissors")
                    .font(.largeTitle).bold()
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text(gameStateTitle)
                            .foregroundColor(.secondary)
                            .font(.title.weight(.heavy))
                        Text(appMoves[move])
                            .font(.largeTitle.weight(.semibold))
                        
                        ForEach(0..<3) { number in
                            Button {
                                moveTapped(number)
                            } label: {
                                Image(playerMoves[number])
                                    .renderingMode(.original)
                                    .shadow(radius: 5)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("\(gameCounter)/10 round!\nYour score is \(score)")
        }
        
        .alert(scoreTitle, isPresented: $gameFinished) {
            Button("Restart", action: reset)
        } message: {
            Text("\(gameCounter)/10 round!\nFinal Score: \(score)")
        }
    }
    
    func moveTapped(_ number: Int) {
        if gameStateTitle == "Win" && playerMoves[number] == winningMoves[move] {
            scoreTitle = "Correct!"
            score += 1
            gameCounter += 1
            showingScore = true
        } else if gameStateTitle == "Lose" && playerMoves[number] == losingMoves[move] {
            scoreTitle = "Correct!"
            score += 1
            gameCounter += 1
            showingScore = true
        } else {
            scoreTitle = "Wrong!"
            if score != 0 {
                score -= 1
            }
            gameCounter += 1
            showingScore = true
        }
        
        if gameCounter == 10 {
            scoreTitle = "You've finished the game!"
            if score == 10 {
                scoreTitle = "Perfect!"
                score += 2
            }
            showingScore = false
            gameFinished = true
        }
    }
    
    func askQuestion() {
        playerMoves.shuffle()
        move = Int.random(in: 0...2)
        shouldWin = Bool.random()
        
        if shouldWin {
            gameStateTitle = "Win"
        } else {
            gameStateTitle = "Lose"
        }
    }
    
    func reset() {
        askQuestion()
        score = 0
        gameCounter = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
