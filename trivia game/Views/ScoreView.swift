//
//  ScoreView.swift
//  trivia game
//
//  Created by David Fu on 9/28/24.
//

import SwiftUI

struct ScoreView: View {
    @Binding var navigationPath: NavigationPath
    @ObservedObject var quiz: QuizViewModel
    @State private var confettiAnimation: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Confetti animation
            ForEach(0..<12, id: \.self) { i in
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 20, height: 20)
                    .offset(x: confettiAnimation ? CGFloat.random(in: -150...150) : CGFloat.random(in: -150...150),
                            y: confettiAnimation ? 800 : -400)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false).delay(Double(i) * 0.1), value: confettiAnimation)
            }
            
            Text("Final Score: \(quiz.score)")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                quiz.resetQuiz()
                navigationPath.append(0)
            }) {
                Text("Restart Quiz")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            Button(action: {
                quiz.resetQuiz()
                navigationPath = NavigationPath()
            }) {
                Text("Return to Welcome Screen")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .onAppear {
            withAnimation(.snappy) {
                confettiAnimation = true
            }
        }
    }
}
