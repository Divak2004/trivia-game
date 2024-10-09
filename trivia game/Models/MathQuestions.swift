//
//  MathQuestions.swift
//  trivia game
//
//  Created by David Fu on 9/29/24.
//

extension Question {
    static let questions: [Question] = [
        .init(
            text: "Which theorem states that every positive integer greater than 1 can be represented as a product of primes in exactly one way?",
            imageName: "fundamental",
            answers: ["Fundamental Theorem of Calculus", "Fundamental Theorem of Algebra", "Fundamental Theorem of Arithmetic", "Fundamental Theorem of Lin Alg"],
            correctAnswer: "Fundamental Theorem of Arithmetic"), 
        .init(
            text: "Which branch of mathematics is also known as 'proof-based calculus'?",
            imageName: "calculus",
            answers: ["Geometry", "Real Analysis", "Abstract Algebra", "Topology"],
            correctAnswer: "Real Analysis"),
        .init(
            text: "What proof technique is used when you assume that the opposite of the claim is true?",
            imageName: "techniques",
            answers: ["Induction", "Contraposition", "Direct", "Contradiction"],
            correctAnswer: "Contradiction"),
        .init(
            text: "What greek letter is commonly used to denote the sample space in probability?",
            imageName: "letters",
            answers: ["Little Omega", "Big Omega", "Little Delta", "Big Delta"],
            correctAnswer: "Big Omega"),
        .init(
            text: "The negation of (p implies q) is...",
            imageName: "truth",
            answers: ["p and not q", "q and not p", "q implies p", "not p and not q"],
            correctAnswer: "p and not q"),
        .init(text: "",
              imageName: "",
              answers: [],
              correctAnswer: "")]
}
