//
//  Scoreboard.swift
//  ScoreKeeper
//
//  Created by Caleb Wolfe on 9/15/25.
//

import Foundation

struct Scoreboard{
    
    var state = GameState.setup
    var doesHighScoreWin = true
    
    var players :[Player] = [
        Player(name: "Caleb", score: 0),
        Player(name: "Mary", score: 0),
        Player(name: "Amanda", score: 0),
    ]
    
    var winners :[Player]{
        guard state == .gameOver else {return []}
        
        var winningScore = 0
        
        if doesHighScoreWin{
            winningScore = Int.min
            for player in players{
                winningScore = max(player.score, winningScore)
            }
        } else{
            winningScore = Int.max
            for player in players{
                winningScore = min(player.score, winningScore)
            }
        }
        
        return players.filter { player in
            player.score == winningScore
        }
    }
    
    mutating func resetScores(to newValue :Int){
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}
