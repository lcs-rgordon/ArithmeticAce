//
//  CheckAnswerButtonView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-09.
//

import SwiftUI

struct CheckAnswerButtonView: View {
    
    // MARK: Stored property
    let firstValue: Int
    let secondValue: Int
    let operation: Operation
    @Binding var inputGiven: String
    @Binding var answerChecked: Bool
    @Binding var answerCorrect: Bool
    
    let correctResponse: Int
    @Binding var history: [QuestionResult]
    
    // MARK: Computed property
    var body: some View {
        
        Button(action: {
            
            // Answer has been checked!
            answerChecked = true
            
            // Convert the input given to an integer, if possible
            guard let answerGiven = Int(inputGiven) else {
                
                // Sadness, not a number
                answerCorrect = false
                
                // Store result in history
                let result = QuestionResult(operation: operation,
                                            firstValue: firstValue,
                                            secondValue: secondValue,
                                            correctResponse: correctResponse,
                                            inputGiven: inputGiven)
                history.append(result)
                
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
            
            // Store result in history
            let result = QuestionResult(operation: operation,
                                        firstValue: firstValue,
                                        secondValue: secondValue,
                                        correctResponse: correctResponse,
                                        inputGiven: inputGiven)
            history.append(result)
            
            // DEBUG
            print("For \(operation) \(history.count) questions have been completed.")
            
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
        CheckAnswerButtonView(firstValue: 7,
                              secondValue: 8,
                              operation: .multiplication,
                              inputGiven: .constant(""),
                              answerChecked: .constant(true),
                              answerCorrect: .constant(true),
                              correctResponse: 56,
                              history: .constant([]))
    }
}
