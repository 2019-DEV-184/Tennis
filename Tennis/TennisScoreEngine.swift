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
    }
    
    struct Player {
        var name: String
        private(set) var points: Points = .love
        
        init(with name: String) { self.name = name }
        
        mutating func score() {
            switch points {
            case .love: points = .fifteen
            case .fifteen: points = .thirty
            case .thirty: points = .forty
            default: fatalError("Undefined action")
            }
        }
    }
    
    var player1: Player
    var player2: Player
    
    init(_ player1Name: String, _ player2Name: String) {
        player1 = Player(with: player1Name)
        player2 = Player(with: player2Name)
    }
    
    func player1Scores() { player1.score() }
    func player2Scores() { player2.score() }
}
