//
//  AnswerAndResultView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-09.
//

import SwiftUI

struct AnswerAndResultView: View {
    
    // MARK: Stored properties

    // Each derived value we need is marked with @Binding
    // These match up directly with the source of truth in the originating view, which is marked with @State
    @Binding var inputGiven: String
    @Binding var answerChecked: Bool
    @Binding var answerCorrect: Bool

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
                            answerChecked: .constant(false),
                            answerCorrect: .constant(false))
    }
}
