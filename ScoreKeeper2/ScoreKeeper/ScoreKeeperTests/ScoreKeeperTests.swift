//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by Caleb Wolfe on 9/15/25.
//

import Testing
@testable import ScoreKeeper

struct ScoreKeeperTests {

    @Test("Reset player scores", arguments: [0, 10, -5])
    func resetScores(to newValue :Int) async throws {
        var scoreboard = Scoreboard(players:[
            Player(name: "Matthew", score: 0),
            Player(name: "Mary", score: 7),
            Player(name: "Amanda", score: 3)
        ])
        
        scoreboard.resetScores(to: newValue)
        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }
    
    @Test("Highest score wins")
    func highestScoreWins(){
        let scoreboard = Scoreboard(
            state: .gameOver,
            doesHighScoreWin: true,
            players: [
                Player(name: "Caleb", score: 4),
                Player(name: "Logan", score: 2)
            ]
        )
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Caleb", score: 4)])
    }
    
    @Test("Lowest score wins")
    func lowestScoreWins(){
        let scoreboard = Scoreboard(
            state: .gameOver,
            doesHighScoreWin: false,
            players: [
                Player(name: "Mary", score: 2),
                Player(name: "Amanda", score: 3)
            ]
        )
        
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Mary", score: 2)])
    }
}
