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
    
    let player1Name: String
    let player2Name: String
    
    private(set) var player1Score: Points = .love
    private(set) var player2Score: Points = .love
    
    init(_ player1Name: String, _ player2Name: String) {
        self.player1Name = player1Name
        self.player2Name = player2Name
    }
    
    func player1Scores() {
        switch player1Score {
        case .love: player1Score = .fifteen
        case .fifteen: player1Score = .thirty
        case .thirty: player1Score = .forty
        case .forty: player1Score = .love
        }
    }
}
