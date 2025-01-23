//
//  ContentView.swift
//  FlagChallenge
//
//  Created by Nikita on 23.01.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FlagViewModel()

    var body: some View {
        switch viewModel.appState {
        case .initial:
            InitialView(startAction: viewModel.startGame)
        case .question, .feedback:
            FlagView(viewModel: viewModel)
        case .finished(let correct, let wrong):
            ResultsView(correct: correct, wrong: wrong, restartAction: viewModel.startGame)
        }
    }
}

#Preview {
    ContentView()
}
