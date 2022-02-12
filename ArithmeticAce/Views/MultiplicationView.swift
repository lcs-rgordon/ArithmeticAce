//
//  MultiplicationView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-07.
//

import SwiftUI

struct MultiplicationView: View {
    
    // MARK: Stored properties
    @State var multiplicand = Int.random(in: 1...12)
    @State var multiplier = Int.random(in: 1...12)
    
    // This string contains whatever the user types in
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // Tracks the history of responses
    @State var history: [QuestionResult] = []
    
    // MARK: Computed properties
    // What is the correct product?
    var correctProduct: Int {
        return multiplicand * multiplier
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            QuestionPresentationView(operation: "✕",
                                     firstValue: multiplicand,
                                     secondValue: multiplier)
            
            Divider()
            
            AnswerAndResultView(inputGiven: $inputGiven,
                                answerChecked: $answerChecked,
                                answerCorrect: $answerCorrect)
                        
            ZStack {
                
                CheckAnswerButtonView(firstValue: multiplicand,
                                      secondValue: multiplier,
                                      operation: .multiplication,
                                      inputGiven: $inputGiven,
                                      answerChecked: $answerChecked,
                                      answerCorrect: $answerCorrect,
                                      correctResponse: correctProduct,
                                      history: $history)

                Button(action: {
                    // Generate a new question
                    multiplicand = Int.random(in: 1...12)
                    multiplier = Int.random(in: 1...12)
                    
                    // Reset properties that track what's happening with the current question
                    answerChecked = false
                    answerCorrect = false
                    
                    // Reset the input field
                    inputGiven = ""
                }, label: {
                    Text("New question")
                        .font(.largeTitle)
                })
                    .padding()
                    .buttonStyle(.bordered)
                // Only show this button when an answer has been checked
                    .opacity(answerChecked == true ? 1.0 : 0.0)
                
            }
            
            ReactionAnimationView(answerCorrect: $answerCorrect,
                                  answerChecked: $answerChecked)

            Spacer()
        }
        .padding(.horizontal)
        .font(.system(size: 72))
        
        
    }
}

struct MultiplicationView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationView()
    }
}
