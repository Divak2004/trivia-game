//
//  QuizViewModel.swift
//  trivia game
//
//  Created by David Fu on 9/28/24.
//

import Foundation

class QuizViewModel: ObservableObject {
  // MARK: - Properties
  @Published var questions: [Question] = [] // Array to store questions
  @Published var currentQuestionIndex: Int = 0 // Index of the current question
  @Published var answered: Bool = false
  @Published var score: Int = 0 // The user's score
  @Published var quizFinished: Bool = false // Flag to determine if the quiz has finished
  @Published var numQuestions: Int = 0

  // MARK: - Initialization
  init() {
    loadQuestions() // Call to load questions into the array
    numQuestions = questions.count-1
  }

  // MARK: - Methods

  /// Initializes questions array with data.
  func loadQuestions() {
    // Hard-coded questions with local images
    self.questions = Question.questions
  }

  /// Processes the selected answer, updates the score and advances to the next question.
  func submitAnswer(answer: String, correctAnswer: String) {
    // Functionality to be implemented: check the selected answer, update score, move to next question or finish quiz.
    answered = true
    if answer == correctAnswer {
        score += 1
    }
  }
    
  func loadNextQuestion() {
    currentQuestionIndex += 1
    answered = false
    if numQuestions == currentQuestionIndex {
        quizFinished = true
    }
  }

  /// Resets the quiz to its initial state for a new game.
  func resetQuiz() {
    // Functionality to be implemented: reset current question index, score, and quiz finished status; reload questions.
    currentQuestionIndex = 0
    answered = false
    score = 0
    quizFinished = false
  }
}
