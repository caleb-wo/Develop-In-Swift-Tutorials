//
//  Player.swift
//  ScoreKeeper
//
//  Created by Caleb Wolfe on 9/13/25.
//

import Foundation


struct Player: Identifiable {
    let id = UUID()
    var name: String
    var score = 0
}
