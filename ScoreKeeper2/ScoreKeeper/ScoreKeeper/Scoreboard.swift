//
//  Scoreboard.swift
//  ScoreKeeper
//
//  Created by Caleb Wolfe on 9/15/25.
//

import Foundation

struct Scoreboard{
    
    var state = GameState.setup
    
    var players :[Player] = [
        Player(name: "Caleb", score: 0),
        Player(name: "Mary", score: 0),
        Player(name: "Amanda", score: 0),
    ]
    
    mutating func resetScores(to newValue :Int){
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}
