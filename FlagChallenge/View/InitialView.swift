//
//  InitialView.swift
//  FlagChallenge
//
//  Created by Nikita on 23.01.2025.
//

import SwiftUI

struct InitialView: View {
    let startAction: () -> Void

    var body: some View {
        VStack {
            Text("Welcome to the Flag Challenge!")
                .font(.largeTitle)
                .padding()

            Button(action: startAction) {
                Text("Start")
                    .font(.title2)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}
