//
//  AnswerAndResultView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-09.
//

import SwiftUI

struct AnswerAndResultView: View {
    
    // MARK: Stored properties

    // All of these are considered "derived values".
    // These match up directly with the sources of truth
    // in the originating view.
    @Binding var inputGiven: String // changes, so @Binding
    let answerChecked: Bool         // not updated, so regular property (let)
    let answerCorrect: Bool         // not updated, so regular property (let)

    // MARK: Computed property
    var body: some View {
        HStack {

            ZStack {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                //        CONDITION      true  false
                    .opacity(answerCorrect == true ? 1.0 : 0.0)
                
                Image(systemName: "x.square")
                    .foregroundColor(.red)
                //        CONDITION1         AND     CONDITION2         true  false
                //       answerChecked = true     answerCorrect = false
                    .opacity(answerChecked == true && answerCorrect == false ? 1.0 : 0.0)
            }
            
            Spacer()
            
            TextField("",
                      text: $inputGiven)
                .multilineTextAlignment(.trailing)
        }

    }
}

struct AnswerAndResultView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerAndResultView(inputGiven: .constant(""),
                            answerChecked: false,
                            answerCorrect: false)
    }
}
