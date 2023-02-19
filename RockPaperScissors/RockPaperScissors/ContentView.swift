//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Karla Gardiner on 19/02/2023.
//

import SwiftUI

extension Color {
    public static var gameDarkGreen = Color(red: 84/255.0, green: 159/255.0, blue: 147/255.0)
    public static var gameLightGreen = Color(red: 159/255.0, green: 175/255.0, blue: 144/255.0)
    public static var gameMauve = Color(red: 226/255.0, green: 194/255.0, blue: 255/255.0)
    public static var gameCoral = Color(red: 239/255.0, green: 131/255.0, blue: 84/255.0)
    public static var gameGray = Color(red: 79/255.0, green: 93/255.0, blue: 117/255.0)
    public static var gameGunmetal = Color(red: 45/255.0, green: 49/255.0, blue: 66/255.0)
    public static var gameSilver = Color(red: 191/255.0, green: 192/255.0, blue: 192/255.0)
}

struct ContentView: View {
    @State private var round = 1
    @State private var score = 0
    @State private var appSelectedMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var showScore = false
    @State private var showGameOver = false
    
    var moves = [["Rock", "👊🏽"], ["Paper", "✋🏽"], ["Scissors", "✌🏽"]]
    var totalRounds = 10
    
    var winningMove: Int {
        switch appSelectedMove {
        case 0:
            return shouldWin ? 2 : 1
        case 1:
            return shouldWin ? 0 : 2
        case 2:
            return shouldWin ? 1 : 0
        default:
            return -1
        }
    }
    
    var body: some View {
            ZStack {
                LinearGradient(
                    colors: [.gameCoral, .gameGunmetal],
                    startPoint: .top,
                    endPoint: .bottom
                ).ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("Rock Paper Scissors")
                        .font(.largeTitle.bold())
                        .foregroundColor(.gameGunmetal)
                    
                    VStack {
                        Spacer()
                        Text("Select the move to")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text("\(shouldWin ? "Win" : "Lose")!")
                            .font(.largeTitle.weight(.semibold))
                            .foregroundColor(.gameGunmetal)
                        
                        Spacer()
                        
                        HStack {
                            Text("Round: \(round)")
                                .font(.subheadline.bold())
                                .foregroundColor(.secondary)
                            Spacer()
                        }
                        
                        HStack {
                            ForEach(0..<3) { move in
                                Button {
                                    moveSelected(move)
                                    
                                } label: {
                                    VStack {
                                        Text(moves[move][1]).font(.largeTitle)
                                        Text(moves[move][0])
                                    }
                                }
                                .foregroundColor(.gameGunmetal)
                            }
                            .frame(maxWidth: .infinity, maxHeight: 100)
                            .background(Color.gameSilver)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(radius: 4)
                        }
                        
                        Spacer()
                        Spacer()
                        
                        Text("Score: \(score)")
                            .font(.subheadline.bold())
                            .foregroundColor(.gameGunmetal)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: 400)
                    .padding()
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding()
                    
                    Spacer()
                    
                .alert(scoreTitle, isPresented: $showScore) {
                    Button("Continue") {
                        nextRound()
                    }
                } message: {
                    Text(scoreMessage)
                }
                .alert("Game Over!", isPresented: $showGameOver) {
                    Button("Play again") {
                        resetGame()
                    }
                }
            }
        }
    }
    
    func moveSelected(_ move: Int) {
        scoreTitle = "Your opponent played: \(moves[appSelectedMove][0])"
        if move == winningMove {
            score += 1
            scoreMessage = "You successfully \(shouldWin ? "won" : "lost")! Congratulations, you gain a point."
        } else {    
            score -= 1
            scoreMessage = "You didn't \(shouldWin ? "win" : "lose") so you lose a point."
        }
        
        scoreMessage = "\(scoreMessage) Your score is now \(score)"
        showScore = true
    }
    
    func nextRound() {
        if round == totalRounds {
            showGameOver = true
        } else {
            round += 1
            appSelectedMove = Int.random(in: 0...2)
            shouldWin.toggle()
        }
    }
    
    func resetGame() {
        round = 1
        score = 0
        appSelectedMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
