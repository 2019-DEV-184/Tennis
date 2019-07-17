//
//  TennisScoreEngine.swift
//  Tennis
//
//  Created by 2019-DEV-184 on 17/07/19.
//  Copyright © 2019 2019-DEV-184. All rights reserved.
//

import Foundation

final class TennisScoreEngine {
    
    enum Points: Int {
        case love = 0
        case fifteen = 1
        case thirty = 2
        case forty = 3
        case advantage
        case win = 5
    }
    
    struct Player {
        var name: String
        var points: Points = .love
        
        init(with name: String) { self.name = name }
    }
    
    var player1: Player
    var player2: Player
    
    init(_ player1Name: String, _ player2Name: String) {
        player1 = Player(with: player1Name)
        player2 = Player(with: player2Name)
    }
    
    private func score(for player: inout Player, otherPlayer: inout Player) {
        // switch on the current points of the player
        switch player.points {
            
        case .love:
            player.points = .fifteen
            
        case .fifteen:
            player.points = .thirty
            
        case .thirty:
            player.points = .forty
            
        case .forty:
            if otherPlayer.points == .forty { player.points = .advantage }
            else if otherPlayer.points == .advantage { otherPlayer.points = .forty }
            else { player.points = .win }
            
        case .advantage:
            player.points = .win
            
        default: fatalError("Undefined action")
        }
    }
    
    // Exposing these 2 functions for easy score keeping
    func player1Scores() { score(for: &player1, otherPlayer: &player2) }
    func player2Scores() { score(for: &player2, otherPlayer: &player1) }
}
