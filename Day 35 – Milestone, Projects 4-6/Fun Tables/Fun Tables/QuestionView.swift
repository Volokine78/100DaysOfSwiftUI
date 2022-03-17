//
//  QuestionView.swift
//  Fun Tables
//
//  Created by Tolga PIRTURK on 15.01.2022.
//

import SwiftUI

struct Question {
    
    var number = 0
    var multipliedNumber = 0
    var text: String {
        "\(number) x \(multipliedNumber) = ?"
    }
    
    var answer: Int {
        number * multipliedNumber
    }
}

struct QuestionView: View {
    @State private var question = Question()
    @State private var userAnswer = 0
    @State private var isAnswered = false
    @State private var gameCounter = 0
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var alertbuttonTitle = ""
    @State private var selectedAction: () -> Void = { }
    
    @FocusState private var answerIsFocused: Bool
    
    let level: Int
    let numberOfQuestions: Int
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Text("What is \(question.text)")
                } header: {
                    Text("Question")
                }
                    
                Section {
                    TextField("Answer", value: $userAnswer, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($answerIsFocused)
                } header: {
                    Text("Answer")
                }
            }
            .onAppear(perform: askQuestion)
            .listStyle(.grouped)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        questionAnswered()
                    }
                }
            }
            .alert(scoreTitle, isPresented: $isAnswered) {
                Button(alertbuttonTitle, action: selectedAction)
            } message: {
                Text("\(gameCounter)/\((numberOfQuestions + 1) * 5)\nYour score is \(score)")
            }
        }
    }
    
    func questionAnswered() {
        let correctAnswer = question.answer
        
        gameCounter += 1
        isAnswered = true
        alertbuttonTitle = "Continue"
        selectedAction = askQuestion
        
        if correctAnswer == userAnswer {
            scoreTitle = "Correct"
            score += 10
        } else {
            scoreTitle = "Wrong!"
            if score != 0 {
                score -= 5
            }
        }
        
        if gameCounter == (numberOfQuestions + 1) * 5 {
            scoreTitle = "You've finished the game!"
            selectedAction = reset
            alertbuttonTitle = "Restart"
            answerIsFocused = false
        }
    }
    
    func askQuestion() {
        userAnswer = 0
        question.multipliedNumber = Int.random(in: 1...level)
        question.number = Int.random(in: 1...level)
        print(userAnswer)
    }
    
    func reset() {
        askQuestion()
        score = 0
        gameCounter = 0
        userAnswer = 0
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(level: 5, numberOfQuestions: 10)
    }
}
