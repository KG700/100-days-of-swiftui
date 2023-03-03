//
//  ContentView.swift
//  Animations
//
//  Created by Karla Gardiner on 01/03/2023.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}


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
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    let letters = Array("Hello, SwiftUI")
    @State private var enabled2 = false
    @State private var dragAmount2 = CGSize.zero
    
    @State private var isShowingRed = false
    @State private var isShowingRed2 = false
    @State private var isShowingRed3 = false
    
    
    var body: some View {
        NavigationView {
            List {
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
                }
                
                VStack {
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
                }
                
                VStack {
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
                
                VStack {
                    Text("Controlling Animation Stack")
                    Button("Tap me") {
                        enabled.toggle()
                    }
                    .frame(width: 200, height: 200)
                    .background(enabled ? .blue : .red)
                    .animation(.default, value: enabled)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
                    .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
                }
                
                VStack {
                    Text("Animating Gestures")
                    LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(width: 300, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .offset(dragAmount)
                        .gesture(
                            DragGesture()
                                .onChanged { dragAmount = $0.translation }
                                .onEnded { _ in
                                    withAnimation {
                                        dragAmount = .zero
                                    }
                                }
                        )
//                        .animation(.spring(), value: dragAmount)
                    
                    HStack(spacing: 0) {
                        ForEach(0..<letters.count, id: \.self) { num in
                            Text(String(letters[num]))
                                .padding(5)
                                .font(.title)
                                .background(enabled2 ? .blue : .red)
                                .offset(dragAmount2)
                                .animation(
                                    .default.delay(Double(num) / 20),
                                    value: dragAmount2
                                )
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { dragAmount2 = $0.translation }
                            .onEnded { _ in
                                dragAmount2 = .zero
                                enabled2.toggle()
                            }
                    )
                }
                
                VStack {
                    Button("Tap Me") {
                        withAnimation {
                            isShowingRed.toggle()
                        }
                    }

                    if isShowingRed {
                        Rectangle()
                            .fill(.red)
                            .frame(width: 200, height: 200)
                            .transition(.scale)
                    }
                    
                    Button("Tap Me") {
                        withAnimation {
                            isShowingRed2.toggle()
                        }
                    }

                    if isShowingRed2 {
                        Rectangle()
                            .fill(.red)
                            .frame(width: 200, height: 200)
                            .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    }
                }

                VStack {
                    Text("Custom transitions using ViewModifier")
                    
                    ZStack {
                        Rectangle()
                            .fill(.blue)
                            .frame(width: 200, height: 200)
                        
                        if isShowingRed3 {
                            Rectangle()
                                .fill(.red)
                                .frame(width: 200, height: 200)
                                .transition(.pivot)
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            isShowingRed3.toggle()
                        }
                    }
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
