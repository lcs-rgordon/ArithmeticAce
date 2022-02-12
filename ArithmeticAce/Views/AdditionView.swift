//
//  AdditionView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-08.
//

import SwiftUI

struct AdditionView: View {
    
    // MARK: Stored properties
    @State var augend = Int.random(in: 1...144)
    @State var addend = 0
    
    // This string contains whatever the user types in
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // Tracks the history of responses
    @State var history: [QuestionResult] = []
    
    // MARK: Computed properties
    // What is the correct sum?
    var correctSum: Int {
        return augend + addend
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            QuestionPresentationView(operation: "+",
                                     firstValue: augend,
                                     secondValue: addend)
            
            Divider()
            
            AnswerAndResultView(inputGiven: $inputGiven,
                                answerChecked: $answerChecked,
                                answerCorrect: $answerCorrect)
            
            ZStack {
                                
                CheckAnswerButtonView(firstValue: augend,
                                      secondValue: addend,
                                      operation: .addition,
                                      inputGiven: $inputGiven,
                                      answerChecked: $answerChecked,
                                      answerCorrect: $answerCorrect,
                                      correctResponse: correctSum,
                                      history: $history)


                Button(action: {
                    // Generate a new question
                    augend = Int.random(in: 1...144)
                    addend = Int.random(in: 1...144 - augend)

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
        // Closure will run once when the view is loaded
        .task {
            addend = Int.random(in: 1...144 - augend)
        }
        
        
    }
}

struct AdditionView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionView()
    }
}
