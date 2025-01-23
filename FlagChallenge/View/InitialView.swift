//
//  InitialView.swift
//  FlagChallenge
//
//  Created by Nikita on 23.01.2025.
//

import SwiftUI

struct InitialView: View {

    var body: some View {
        VStack {
            Text("Welcome to the Flag Challenge!")
                .font(.largeTitle)
                .padding()

            Button {
                print("Button tapped")
            } label: {
                Text("Start Game")
                    .font(.title2)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    InitialView()
}
