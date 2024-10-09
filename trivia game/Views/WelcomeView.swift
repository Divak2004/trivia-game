//
//  WelcomeView.swift
//  trivia game
//
//  Created by David Fu on 9/28/24.
//

import SwiftUI

struct WelcomeView: View {
    @State private var navigationPath = NavigationPath()
    @StateObject var quiz = QuizViewModel()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                Text("Math Jam")
                    .font(.largeTitle)
                    .padding()
                
                Text("Welcome to the funnest math trivia!")
                    .font(.headline)
                    .padding()

                Button("Start Quiz") {
                    navigationPath.append(0)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                Text("""
                     Click 'Start Quiz' to begin the game. Each question has 4 answer choices. Select the answer choice that you think is correct. You will be given 15 seconds to answer each question. Your score will be displayed throughout the game, and you will get to see your final score at the end too.
                     """)
                    .font(.subheadline)
                    .padding()
            }
            .navigationDestination(for: Int.self) { _ in
                if quiz.quizFinished {
                    ScoreView(navigationPath: $navigationPath, quiz: quiz)
                } else {
                    QuestionView(navigationPath: $navigationPath, quiz: quiz)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WelcomeView()
}
