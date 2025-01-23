//
//  AppState.swift
//  FlagChallenge
//
//  Created by Nikita on 23.01.2025.
//

enum AppState: Equatable {
    case initial
    case question(Int)
    case feedback(isCorrect: Bool)
    case finished(correct: Int, wrong: Int)
}
