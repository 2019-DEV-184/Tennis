//
//  TennisTests.swift
//  TennisTests
//
//  Created by 2019-DEV-184 on 17/07/19.
//  Copyright © 2019 2019-DEV-184. All rights reserved.
//

import XCTest
@testable import Tennis

class TennisTests: XCTestCase {
    
    func test_Initialisation() {
        // given
        let player1 = "Player1"
        let player2 = "Player2"
        
        // when
        let sut = TennisScoreEngine(player1, player2)
        
        // then
        XCTAssertEqual(sut.player1Name, "Player1")
        XCTAssertEqual(sut.player2Name, "Player2")
        XCTAssertEqual(sut.player1Score, .love)
        XCTAssertEqual(sut.player2Score, .love)
    }
    
    func test_Player1ScoresOnce_Player1ScoreIs15() {
        // given
        let player1 = "Player1"
        let player2 = "Player2"
        let sut = TennisScoreEngine(player1, player2)
        
        // when
        sut.player1Scores()
        
        // then
        XCTAssertEqual(sut.player1Score, .fifteen)
    }
    
    func test_Player1ScoresTwice_Player1ScoreIs30() {
        // given
        let player1 = "Player1"
        let player2 = "Player2"
        let sut = TennisScoreEngine(player1, player2)
        
        // when
        sut.player1Scores()
        sut.player1Scores()
        
        // then
        XCTAssertEqual(sut.player1Score, .thirty)
    }
    
    func test_Player1ScoresThrice_Player1ScoreIs40() {
        // given
        let player1 = "Player1"
        let player2 = "Player2"
        let sut = TennisScoreEngine(player1, player2)
        
        // when
        sut.player1Scores()
        sut.player1Scores()
        sut.player1Scores()
        
        // then
        XCTAssertEqual(sut.player1Score, .forty)
    }
}
