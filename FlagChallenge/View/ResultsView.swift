//
//  ResultsView.swift
//  FlagChallenge
//
//  Created by Nikita on 23.01.2025.
//

import SwiftUI

struct ResultsView: View {
    let correct: Int
    let wrong: Int
    let restartAction: () -> Void

    var body: some View {
        VStack(spacing: 15) {
            Text("Game Over")
                .font(.largeTitle)

            Text("Last game results: ")
                .font(.title2)
            
            Text("Correct: \(correct)")
                .font(.system(size: 17))
                .foregroundStyle(.green)
            
            Text("Wrong: \(wrong)")
                .font(.system(size: 17))
                .foregroundStyle(.red)

            Button(action: restartAction) {
                Text("Play Again")
                    .font(.title2)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}
