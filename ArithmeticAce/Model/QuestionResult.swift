//
//  QuestionResult.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-12.
//

import Foundation

struct QuestionResult: Identifiable {
    let id = UUID()
    let date = Date()
    let operation: Operation
    let firstValue: Int
    let secondValue: Int
    let correctResponse: Int
    let inputGiven: String
}
