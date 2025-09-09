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
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .background(.white).cornerRadius(15)
            
            Button("Roll"){
                withAnimation {
                    pipNumber = Int.random(in: 1...6)
                }
            }.buttonStyle(.bordered).tint(.black)
            
        }
    }
}

#Preview {
    DiceView()
}
