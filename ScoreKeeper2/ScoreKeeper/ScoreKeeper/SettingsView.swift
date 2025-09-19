//
//  SettingsView.swift
//  ScoreKeeper
//
//  Created by Caleb Wolfe on 9/16/25.
//

import SwiftUI

struct SettingsView: View {
    @Binding var startingPoints :Int
    @Binding var doesHighestScoreWin :Bool
    @Binding var roundCount :Int
    @Environment(\.isEnabled) var isEnabled :Bool
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Game Rules")
                .font(.headline)
            
            Divider()
            Stepper("Rounds: \(roundCount)", value: $roundCount)
                .opacity(isEnabled ? 1 : 0)
            
            Picker("Win condition", selection: $doesHighestScoreWin){
                Text("Highest Score Wins").tag(true)
                Text("Lowest Score Wins").tag(false)
            }
            
            Picker("Starting points", selection: $startingPoints){
                Text("0 starting points").tag(0)
                Text("10 starting points").tag(10)
                Text("20 starting points").tag(20)
            }
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10))
    }
}

#Preview {
    @Previewable @State var doesHighestScoreWin = true
    @Previewable @State var startingPoints = 10
    @Previewable @State var roundCount = 0
    
    SettingsView(startingPoints: $startingPoints,
                 doesHighestScoreWin: $doesHighestScoreWin,
                 roundCount: $roundCount)
}
