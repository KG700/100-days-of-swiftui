//
//  ContentView.swift
//  Animations
//
//  Created by Karla Gardiner on 01/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmountDefault = 1.0
    @State private var animationAmountEaseOut = 1.0
    @State private var animationAmountSpring = 1.0
    @State private var animationAmountDuration = 1.0
    @State private var animationAmountDelay = 1.0
    @State private var animationAmountRepeat = 1.0
    @State private var animationAmountForever = 1.0
    @State private var animationAmountOverlay = 1.0
    @State private var animationAmountStepper = 1.0
    @State private var animationAmountSpin = 0.0
    @State private var animationAmountSpinSpring = 0.0
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Implicit Animations")
                    .font(.headline)
                HStack {
                    Button(".default") {
                        animationAmountDefault += 1
                    }
                    .padding(50)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .scaleEffect(animationAmountDefault)
                    .blur(radius: (animationAmountDefault - 1) * 3)
                    .animation(.default, value: animationAmountDefault)
                    
                    Button(".easeOut") {
                        animationAmountEaseOut += 1
                    }
                    .padding(50)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .scaleEffect(animationAmountEaseOut)
                    .blur(radius: (animationAmountEaseOut - 1) * 3)
                    .animation(.easeOut, value: animationAmountEaseOut)
                    
                    Button(".interpolatingSpring") {
                        animationAmountSpring += 1
                    }
                    .padding(50)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .scaleEffect(animationAmountSpring)
                    .blur(radius: (animationAmountSpring - 1) * 3)
                    .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmountSpring)
                }
                
                Text("Custom Animations")
                HStack {
                    Button(".easeInOut 2secs") {
                        animationAmountDuration += 1
                    }
                    .padding(50)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .scaleEffect(animationAmountDuration)
                    .blur(radius: (animationAmountDuration - 1) * 3)
                    .animation(.easeInOut(duration: 2), value: animationAmountDuration)
                    
                    Button(".easeInOut with delay") {
                        animationAmountDelay += 1
                    }
                    .padding(50)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .scaleEffect(animationAmountDelay)
                    .blur(radius: (animationAmountDelay - 1) * 3)
                    .animation(
                        .easeInOut(duration: 2)
                        .delay(1),
                        value: animationAmountDelay)
                    
                    Button(".repeatCount") {
                        animationAmountRepeat += 1
                    }
                    .padding(50)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .scaleEffect(animationAmountRepeat)
                    .blur(radius: (animationAmountRepeat - 1) * 3)
                    .animation(
                        .easeInOut(duration: 2)
                        .repeatCount(3, autoreverses: true),
                        value: animationAmountRepeat)
                }
                
                HStack {
                    Button(".repeatForever") {
                        animationAmountForever += 1
                    }
                    .padding(50)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .scaleEffect(animationAmountForever)
                    .blur(radius: (animationAmountForever - 1) * 3)
                    .animation(
                        .easeInOut(duration: 2)
                        .repeatForever(autoreverses: true),
                        value: animationAmountForever)
                    
                    Button(".onAppear") {
                        animationAmountOverlay += 1
                    }
                    .padding(50)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(.red)
                            .scaleEffect(animationAmountOverlay)
                            .opacity(2 - animationAmountOverlay)
                            .animation(
                                .easeInOut(duration: 2)
                                    .repeatForever(autoreverses: false),
                                value: animationAmountOverlay)
                    )
                    .onAppear {
                        animationAmountOverlay = 2
                    }

                }
                
                Text("Animating Bindings")
                Stepper("Scale amount", value: $animationAmountStepper.animation(
                    .easeInOut(duration: 1)
                        .repeatCount(3, autoreverses: true)
                ), in: 1...10)
                
                Button("Stepper") {
                    animationAmountStepper += 1
                }
                .padding(50)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmountStepper)
                
                Text("Explict Animations")
                HStack {
                    Button("Spin") {
                        withAnimation {
                            animationAmountSpin += 360
                        }
                    }
                    .padding(50)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .rotation3DEffect(.degrees(animationAmountSpin), axis: (x: 0, y: 1, z: 0))
                    
                    Button("Spin with Spring") {
                        withAnimation(.interpolatingSpring(stiffness: 50, damping: 1)) {
                            animationAmountSpinSpring += 360
                        }
                    }
                    .padding(50)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .rotation3DEffect(.degrees(animationAmountSpinSpring), axis: (x: 0, y: 1, z: 0))
                }
                

            }
            .navigationTitle("Animations")
            .toolbar {
                Button("reset", action: resetButtons)
            }
        }
    }
    
    func resetButtons() {
        animationAmountDefault = 1.0
        animationAmountEaseOut = 1.0
        animationAmountSpring = 1.0
        animationAmountDuration = 1.0
        animationAmountDelay = 1.0
        animationAmountRepeat = 1.0
        animationAmountForever = 1.0
        animationAmountOverlay = 1.0
        animationAmountStepper = 1.0
        animationAmountSpin = 0.0
        animationAmountSpinSpring = 0.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
