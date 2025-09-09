//
//  ContentView.swift
//  DiceRoller
//
//  Created by Caleb Wolfe on 9/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfDice = 1
    @State private var dividedByZero = false
    private let maxDieCount = 5
    
    var body: some View {
        VStack{
            Text("Dice Roller")
                .font(.largeTitle
                      .lowercaseSmallCaps()
                      .bold())
            HStack{
                ForEach(1...numberOfDice, id: \.description){_ in
                    DiceView()
                }
            }
            
            HStack{
                Spacer()
                Button("Add Dice", systemImage: "plus.circle.fill"){
                    withAnimation{
                        numberOfDice += 1
                    }
                }
                .padding()
                .background(.green ,
                            in :RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(.white)
                .disabled(numberOfDice == maxDieCount)
                
                Button("Remove Dice", systemImage: "minus.circle.fill"){
                    if (numberOfDice > 1){
                        withAnimation{
                            numberOfDice -= 1
                        }
                    } else{
                        dividedByZero = true
                    }
                }
                .padding()
                .background(.red,
                            in :RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(.white)
                Spacer()
            }
            .labelStyle(.iconOnly)
            .font(.title)
        }
        .padding()
        .alert("Can't Remove",
               isPresented: $dividedByZero){
                Button("Okay"){}
            } message: {
                Text("You must have one die.")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appBackground)
}
}

#Preview {
    ContentView()
}
