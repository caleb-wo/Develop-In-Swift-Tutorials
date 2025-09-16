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
}
