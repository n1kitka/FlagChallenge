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
            Text("Which country does this flag belong to?")
                .font(.headline)
                .padding(.top, 30)
            
            Text(viewModel.currentQuestion.flag)
                .font(.system(size: 100))
            
        }
    }
}
