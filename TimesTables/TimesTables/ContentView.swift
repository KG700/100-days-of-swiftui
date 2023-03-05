//
//  ContentView.swift
//  TimesTables
//
//  Created by Karla Gardiner on 05/03/2023.
//

import SwiftUI

//checklist
//- computed property for correct answer
//- work out how to reset answer to nil for next question
//- create separate views for each appState
//- Display results
//- Add animations when user gets an answer correct
//- Add shake animation when user gets answer wrong
//- Change to number keyboard for answers
//- During questions, put a button in the keyboard toolbar for 'Done' to replace the 'submit' button
//- On settings page - make selected number a different colour
//- On settings page - make selected number have no shadow and slightly offset (with animation) to make it look like it's been pressed down (and reverse that when another button is pressed)
//- Format picker so it's colourful
//- Format the 'Let's start!' and 'Play again' buttons to something colourful
//- Centre the question
//- Format question so it's bigger, playful font, and a colour (turquoise maybe?)
//- Maybe try an animation that drops the answered number off screen and drops in the next number
//- Add validations to settings' 'Let's start' button to make sure the user has selected the times tables and the number of questions
//- Add validations to submitting answer to make sure an answer has been submitted


extension Color {
    public static var appCharcoal = Color(red: 43/255.0, green: 45/255.0, blue: 66/255.0)
    public static var appPink = Color(red: 232/255.0, green: 106/255.0, blue: 146/255.0)
    public static var appYellow = Color(red: 247/255.0, green: 231/255.0, blue: 51/255.0)
    public static var appWhite = Color(red: 247/255.0, green: 247/255.0, blue: 249/255.0)
    public static var appTurquoise = Color(red: 65/255.0, green: 226/255.0, blue: 186/255.0)
}

struct ContentView: View {
    @State private var tableToPractice: Int = 0
    @State private var mulitpliedNumber = Int.random(in: 2...12)
    @State private var selectedQuestions: Int = 0
    @State private var questionsAsked = 0
    @State private var answer: Int? = nil
    @State private var isCorrect = false
    
    @State private var appState = States.settings
    @State private var answerSubmitted = false
    
    var numberOfQuestions = [5, 10, 20]
    
    enum States {
        case settings, questions, results
    }
    
    var body: some View {
        ZStack {
//            Color.appWhite.ignoresSafeArea()
            LinearGradient(colors: [.appPink, .appWhite, .appTurquoise], startPoint: .top, endPoint: .bottom)
            
            switch appState {
                
            case .settings:
                VStack {
                    Section {
                        ForEach(0..<3) { row in
                            HStack {
                                ForEach(1..<5) { number in
                                    if ((row != 2) || (number != 4)) {
                                        Button("\(number + 1 + (row * 4))") {
                                            selectedTimesTable(table: number + 1 + (row * 4))
                                        }
                                            .font(.title).bold()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.appCharcoal)
                                            .background(Color.appYellow)
                                            .clipShape(Circle())
                                            .overlay(
                                                Circle()
                                                    .stroke(Color.appCharcoal, lineWidth: 3)
                                            )
                                            .shadow(color: .appCharcoal, radius: 5, x: 0, y: 5)
                                    }
                                }
                            }
                        }
                    } header: {
                        Text("Select the times table to practice")
                            .font(.headline)
                            .foregroundColor(.appCharcoal)
                    }
                    
                    Section {
                        Picker("How many questions would you like?", selection: $selectedQuestions) {
                            ForEach(numberOfQuestions, id:\.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                        .foregroundColor(Color.orange)
                    } header: {
                        Text("How many questions would you like?")
                    }
                    
                    Button("Let's start!") {
                        appState = .questions
                    }

                }
            case .questions:
                VStack {
                    Text("Question #\(questionsAsked + 1)")
                    HStack {
                        Text("\(tableToPractice) x \(mulitpliedNumber) =")
                        TextField("Answer", value: $answer, format: .number)
                    }
                    if answerSubmitted {
                        if isCorrect {
                            Text("That's correct!")
                        } else {
                            Text("Oh no! That's wasn't right")
                            Text("The correct answer is: \(tableToPractice * mulitpliedNumber)")
                        }
                        
                        Button("Next", action: nextQuestion)
                    } else {
                        Button("submit") {
                            submitAnswer()
                        }
                    }

                }
            case .results:
                VStack {
                    Text("Your results!")
                    Button("Play again", action: resetGame)
                }
            }
        }
    }
    
    func selectedTimesTable(table: Int) {
        tableToPractice = table
    }
    
    func submitAnswer() {
        isCorrect = (tableToPractice * mulitpliedNumber) == answer
        answerSubmitted.toggle()
    }
    
    func nextQuestion() {
        questionsAsked += 1
        answer = 0
        
        if questionsAsked == selectedQuestions {
            appState = .results
        } else {
            mulitpliedNumber = Int.random(in: 2...12)
            answerSubmitted.toggle()
        }
    }
    
    func resetGame() {
        tableToPractice = 0
        mulitpliedNumber = Int.random(in: 2...12)
        selectedQuestions = 0
        questionsAsked = 0
        appState = .settings
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
