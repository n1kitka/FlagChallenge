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
        currentStep = 0
        appState = .question(currentStep + 1)
        loadNextQuestion()
    }

    private func loadNextQuestion() {
        guard currentStep < totalSteps else {
            appState = .finished
            return
        }

        let shuffledCountries = countries.shuffled()
        let correctCountry = shuffledCountries[0]
        let incorrectAnswer = shuffledCountries[1].name
        correctAnswer = correctCountry.name
        currentQuestion = (flag: correctCountry.flag, options: [correctAnswer, incorrectAnswer].shuffled())
    }

    func nextStep() {
        currentStep += 1
        appState = .question(currentStep + 1)
        loadNextQuestion()
    }
}
