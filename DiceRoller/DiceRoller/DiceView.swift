//
//  DiceView.swift
//  DiceRoller
//
//  Created by Caleb Wolfe on 9/7/25.
//

import SwiftUI

struct DiceView: View {
    @State private var pipNumber = 1
    
    var body: some View {
        
        VStack {
            Image(systemName: "die.face.\(pipNumber)")
                .resizable()
                .frame(width: 100, height: 100)
            
            Button("Roll"){
                withAnimation {
                    pipNumber = Int.random(in: 1...6)
                }
            }.buttonStyle(.bordered)
            
        }
    }
}

#Preview {
    DiceView()
}
