//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Karla Gardiner on 13/02/2023.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.secondary)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct FlagImage: View {
    var image: String
    
    var body: some View {
        Image(image)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var showingGameSummary = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questionNumber = 0
    @State private var spinAmount = [0.0, 0.0, 0.0]
    @State private var opacityAmount = [1.0, 1.0, 1.0]
    @State private var scaleAmount = [1.0, 1.0, 1.0]
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    let gamesPerRound = 8
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 233/255.0, green: 218/255.0, blue: 193/255.0), location: 0.3),
                .init(color: Color(red: 158/255.0, green: 210/255.0, blue: 198/255.0), location: 0.3)
                
                
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .titleStyle()
                
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
                            flagTapped(number)
                            withAnimation {
                                spinAmount[number] += 360
                                for num in 0..<3 {
                                    if (num != number) {
                                        opacityAmount[num] = 0.25
                                        scaleAmount[num] = 0.75
                                    }
                                }
                            }
                        } label: {
                            FlagImage(image: countries[number])
                        }
                        .scaleEffect(scaleAmount[number])
                        .rotation3DEffect(.degrees(spinAmount[number]), axis: (x: 0, y: 1, z: 0))
                        .opacity(opacityAmount[number])
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game Over", isPresented: $showingGameSummary) {
            Button("Start Again", action: resetGame)
        } message: {
            Text("Your final score was: \(score) out of \(gamesPerRound)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        
        questionNumber += 1
        showingScore = true
        
    }
    
    func askQuestion() {
        if questionNumber == gamesPerRound {
            showingGameSummary = true
        } else {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            withAnimation {
                for number in 0..<3 {
                    opacityAmount[number] = 1.0
                    scaleAmount[number] = 1.0
                }
            }
        }
    }
    
    func resetGame() {
        score = 0
        questionNumber = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        withAnimation {
            for number in 0..<3 {
                opacityAmount[number] = 1.0
                scaleAmount[number] = 1.0
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
