//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Caleb Wolfe on 9/13/25.
//

import SwiftUI

struct ContentView: View {
    @State private var players :[Player] = [
        Player(name: "Caleb", score: 0),
        Player(name: "Mary", score: 0),
        Player(name: "Amanda", score: 0)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            Grid {
                GridRow{
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .font(.headline)
                
                ForEach($players){ $player in
                    GridRow {
                        TextField("Name", text: $player.name)
                        Text("\(player.score)")
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                    }
                }
            }.padding(.vertical) // Grid
            
            Button("Add Player", systemImage: "plus"){
                players.append(
                    Player(name: "", score: 0)
                )
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
