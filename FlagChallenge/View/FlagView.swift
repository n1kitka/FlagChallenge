//
//  FlagView.swift
//  FlagChallenge
//
//  Created by Nikita on 23.01.2025.
//

import SwiftUI

struct FlagView: View {
    @ObservedObject var viewModel: FlagViewModel

    var body: some View {
        VStack {
            //Spacer()
            Text("Which country does this flag belong to?")
                .font(.headline)
                .padding(.top, 30)

            Text(viewModel.currentQuestion.flag)
                .font(.system(size: 100))

            ForEach(viewModel.currentQuestion.options, id: \ .self) { option in
                Button(action: { print("pressed on option \(option)") }) {
                    Text(option)
                        .font(.title2)
                        .padding()
                        .background(.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.top, 10)
                }
            }

            Spacer()
            
            Button(action: viewModel.nextStep) {
                Text("Next")
                    .font(.title2)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.top, 10)
            }
            .padding()
        }
    }
}
