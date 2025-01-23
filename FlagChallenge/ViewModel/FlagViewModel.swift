//
//  FlagViewModel.swift
//  FlagChallenge
//
//  Created by Nikita on 23.01.2025.
//

import SwiftUI
import Combine

class FlagViewModel: ObservableObject {
    @Published var appState: AppState = .initial
    @Published var currentQuestion: (flag: String, options: [String]) = ("", [])
    @Published var score = 0
    @Published var feedbackMessage: String? = nil

    private var countries: [Country] = []
    private var correctAnswer: String = ""
    private var currentStep: Int = 0
    private let totalSteps = 5

    init() {
        setupCountries()
    }

    private func setupCountries() {
        countries = [
            Country(name: "Ukraine", flag: "🇺🇦"),
            Country(name: "Germany", flag: "🇩🇪"),
            Country(name: "Italy", flag: "🇮🇹"),
            Country(name: "Scotland", flag: "🏴󠁧󠁢󠁳󠁣󠁴󠁿"),
            Country(name: "United States", flag: "🇺🇸")
        ]
    }
    
    func startGame() {
        score = 0
        currentStep = 0
        feedbackMessage = nil
        appState = .question(currentStep + 1)
        loadNextQuestion()
    }

    private func loadNextQuestion() {
        guard currentStep < totalSteps else {
            appState = .finished(correct: score, wrong: totalSteps-score)
            return
        }

        let shuffledCountries = countries.shuffled()
        let correctCountry = shuffledCountries[0]
        let incorrectAnswer = shuffledCountries[1].name
        correctAnswer = correctCountry.name
        currentQuestion = (flag: correctCountry.flag, options: [correctAnswer, incorrectAnswer].shuffled())
    }

    func submitAnswer(_ answer: String) {
        if answer == correctAnswer {
            score += 1
            feedbackMessage = "Success, well done!"
        } else {
            feedbackMessage = "It's wrong ;( You can do better, let's go!"
        }
        appState = .feedback(isCorrect: answer == correctAnswer)
    }

    func nextStep() {
        currentStep += 1
        feedbackMessage = nil
        appState = .question(currentStep + 1)
        loadNextQuestion()
    }
}
