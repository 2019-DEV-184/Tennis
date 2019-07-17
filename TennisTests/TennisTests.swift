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
        XCTAssertEqual(sut.player1.name, "Player1")
        XCTAssertEqual(sut.player2.name, "Player2")
        XCTAssertEqual(sut.player1.points, .love)
        XCTAssertEqual(sut.player2.points, .love)
    }
}

// Testing player1 scoring
extension TennisTests {
    func test_Player1ScoresOnce_Player1ScoreIs15() {
        // given
        let player1 = "Player1"
        let player2 = "Player2"
        let sut = TennisScoreEngine(player1, player2)
        
        // when
        sut.player1Scores()
        
        // then
        XCTAssertEqual(sut.player1.points, .fifteen)
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
        XCTAssertEqual(sut.player1.points, .thirty)
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
        XCTAssertEqual(sut.player1.points, .forty)
    }
}

// Testing player2 scoring
extension TennisTests {
    func test_Player2ScoresOnce_Player2ScoreIs15() {
        // given
        let player1 = "Player1"
        let player2 = "Player2"
        let sut = TennisScoreEngine(player1, player2)
        
        // when
        sut.player2Scores()
        
        // then
        XCTAssertEqual(sut.player2.points, .fifteen)
    }
    
    func test_Player2ScoresTwice_Player2ScoreIs30() {
        // given
        let player1 = "Player1"
        let player2 = "Player2"
        let sut = TennisScoreEngine(player1, player2)
        
        // when
        sut.player2Scores()
        sut.player2Scores()
        
        // then
        XCTAssertEqual(sut.player2.points, .thirty)
    }
    
    func test_Player2ScoresThrice_Player2ScoreIs40() {
        // given
        let player1 = "Player1"
        let player2 = "Player2"
        let sut = TennisScoreEngine(player1, player2)
        
        // when
        sut.player2Scores()
        sut.player2Scores()
        sut.player2Scores()
        
        // then
        XCTAssertEqual(sut.player2.points, .forty)
    }
}
