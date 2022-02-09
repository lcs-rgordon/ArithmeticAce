//
//  QuestionPresentationView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-09.
//

import SwiftUI

struct QuestionPresentationView: View {
    
    // MARK: Stored properies
    var operation: String
    var firstValue: Int
    var secondValue: Int
    
    // MARK: Computed property
    var body: some View {
        HStack {
            Text("\(operation)")
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(firstValue)")
                Text("\(secondValue)")
            }
        }
    }
}

struct QuestionPresentationView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionPresentationView(operation: "✕",
                                 firstValue: Int.random(in: 1...12),
                                 secondValue: Int.random(in: 1...12))
    }
}
