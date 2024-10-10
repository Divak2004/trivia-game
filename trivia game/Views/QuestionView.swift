//
//  QuestionView.swift
//  trivia game
//
//  Created by David Fu on 9/28/24.
//
import SwiftUI

struct QuestionView: View {
    @Binding var navigationPath: NavigationPath
    @ObservedObject var quiz: QuizViewModel

    @State private var remainingTime: Int = 15
    @State private var timerActive: Bool = true
    @State private var isBlurred: Bool = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        let question: Question = quiz.questions[quiz.currentQuestionIndex]
        
        VStack {
            Text("Score: \(quiz.score)")
                .font(.headline)
                .padding()
            
            Text("Time remaining: \(remainingTime) seconds")
                .font(.subheadline)
                .foregroundColor(remainingTime > 5 ? .black : .red)
                .padding()
            
            Image(question.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            
            Text(question.text)
                .font(.subheadline)
                .padding()
                .fixedSize(horizontal: false, vertical: true)
            
            ForEach(question.answers, id: \.self) { answer in
                Button(action: {
                    if !quiz.answered {
                        quiz.answered = true
                        timerActive = false
                        quiz.submitAnswer(answer: answer, correctAnswer: question.correctAnswer)
                        withAnimation(.easeInOut(duration: 0.5)) {
                            isBlurred.toggle() // Start blur animation
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            quiz.loadNextQuestion()
                            navigationPath.append(quiz.currentQuestionIndex)
                        }
                    }
                }) {
                    Text(answer)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .disabled(quiz.answered)
            }
        }
        .padding()
        .onReceive(timer) { _ in
            guard timerActive else { return }
            
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                if !quiz.answered {
                    quiz.answered = true
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isBlurred.toggle() // Start blur animation
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        quiz.loadNextQuestion()
                        navigationPath.append(quiz.currentQuestionIndex)
                    }
                }
                timerActive = false
            }
        }
        .navigationBarBackButtonHidden(true)
        .blur(radius: isBlurred ? 10 : 0)
        .opacity(isBlurred ? 0.5 : 1.0) 
        .animation(.easeInOut(duration: 0.5), value: isBlurred)
    }
}
