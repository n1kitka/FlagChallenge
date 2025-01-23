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
    private var correctAnswer = ""
    
    let totalSteps = 5
    var currentStep = 0
    
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
    
    func loadNextQuestion() {
        guard currentStep < totalSteps else {
            appState = .finished
            return
        }
        
        let shuffledCoutries = countries.shuffled()
        let currentCountry = shuffledCoutries[0]
        let incorrectAnswer = shuffledCoutries[1].name
        correctAnswer = currentCountry.name
        currentQuestion = (flag: currentCountry.flag, options: [correctAnswer, incorrectAnswer].shuffled())
    }
}
