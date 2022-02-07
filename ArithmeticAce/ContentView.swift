//
//  ContentView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            HStack {
                Text("✕")
                
                Spacer()
                
                VStack {
                    Text("5")
                    Text("6")
                }
            }
            .font(.system(size: 72))
            .padding()
            
            Divider()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
