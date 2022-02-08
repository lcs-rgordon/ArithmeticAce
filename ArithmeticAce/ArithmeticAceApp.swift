//
//  ArithmeticAceApp.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-07.
//

import SwiftUI

@main
struct ArithmeticAceApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                MultiplicationView()
                    .tabItem {
                        Image(systemName: "multiply.circle")
                        Text("Mutiply")
                    }
                
                AdditionView()
                    .tabItem {
                        Image(systemName: "plus.circle")
                        Text("Add")
                    }
            }
        }
    }
}
