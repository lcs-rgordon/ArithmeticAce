//
//  CheckAnswerButtonView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-09.
//

import SwiftUI

struct CheckAnswerButtonView: View {
    
    // MARK: Stored property
    @Binding var inputGiven: String
    @Binding var answerChecked: Bool
    @Binding var answerCorrect: Bool
    let correctResponse: Int
    
    // MARK: Computed property
    var body: some View {
        
        Button(action: {
            
            // Answer has been checked!
            answerChecked = true
            
            // Convert the input given to an integer, if possible
            guard let answerGiven = Int(inputGiven) else {
                // Sadness, not a number
                answerCorrect = false
                return
            }
            
            // Check the answer!
            if answerGiven == correctResponse {
                // Celebrate! 👍🏼
                answerCorrect = true
            } else {
                // Sadness, they gave a number, but it's correct 😭
                answerCorrect = false
            }
        }, label: {
            Text("Check Answer")
                .font(.largeTitle)
        })
            .padding()
            .buttonStyle(.bordered)
        // Only show this button when an answer has not been checked
            .opacity(answerChecked == false ? 1.0 : 0.0)

    }
}

struct CheckAnswerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CheckAnswerButtonView(inputGiven: .constant(""),
                              answerChecked: .constant(true),
                              answerCorrect: .constant(false),
                              correctResponse: 7)
    }
}
