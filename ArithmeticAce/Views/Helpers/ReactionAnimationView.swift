//
//  ReactionAnimationView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-09.
//

import SwiftUI

struct ReactionAnimationView: View {
    
    // MARK: Stored properties
    @Binding var answerCorrect: Bool
    @Binding var answerChecked: Bool
    
    // MARK: Computed property
    var body: some View {
        
        // Reaction animation
        ZStack {
            
            // Correct animation
            LottieView(animationNamed: "51926-happy")
                .opacity(answerCorrect == true ? 1.0 : 0.0)
                .padding()

            // Incorrect animation
            LottieView(animationNamed: "91726-sad-guy-is-walking")
                .opacity(answerChecked == true && answerCorrect == false ? 1.0 : 0.0)
                .padding()
            
        }

    }
}

struct ReactionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Correct answer condition
        ReactionAnimationView(answerCorrect: .constant(true),
                              answerChecked: .constant(true))
        
        // Incorect answer condition
        ReactionAnimationView(answerCorrect: .constant(false),
                              answerChecked: .constant(true))
    }
}
