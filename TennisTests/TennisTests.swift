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
    
    func getMockSUT() -> TennisScoreEngine { return TennisScoreEngine("Player1", "Player2") }
}

// Testing player1 scoring (upto forty) scenarios
extension TennisTests {
    func test_Player1ScoresOnce_Player1ScoreIs15() {
        // given
        let sut = getMockSUT()
        
        // when
        sut.player1Scores()
        
        // then
        XCTAssertEqual(sut.player1.points, .fifteen)
    }
    
    func test_Player1ScoresTwice_Player1ScoreIs30() {
        // given
        let sut = getMockSUT()
        
        // when
        sut.player1Scores()
        sut.player1Scores()
        
        // then
        XCTAssertEqual(sut.player1.points, .thirty)
    }
    
    func test_Player1ScoresThrice_Player1ScoreIs40() {
        // given
        let sut = getMockSUT()
        
        // when
        sut.player1Scores()
        sut.player1Scores()
        sut.player1Scores()
        
        // then
        XCTAssertEqual(sut.player1.points, .forty)
    }
}

// Testing player2 scoring (upto forty) scenarios
extension TennisTests {
    func test_Player2ScoresOnce_Player2ScoreIs15() {
        // given
        let sut = getMockSUT()
        
        // when
        sut.player2Scores()
        
        // then
        XCTAssertEqual(sut.player2.points, .fifteen)
    }
    
    func test_Player2ScoresTwice_Player2ScoreIs30() {
        // given
        let sut = getMockSUT()
        
        // when
        sut.player2Scores()
        
        sut.player2Scores()
        
        // then
        XCTAssertEqual(sut.player2.points, .thirty)
    }
    
    func test_Player2ScoresThrice_Player2ScoreIs40() {
        // given
        let sut = getMockSUT()
        
        // when
        sut.player2Scores()
        sut.player2Scores()
        sut.player2Scores()
        
        // then
        XCTAssertEqual(sut.player2.points, .forty)
    }
}

// Testing Player1 no-deuce wins scenarios
extension TennisTests {
    
    // GameType1 = P1, P2, P1, P2, P1, P1
    // P1 - Win, P2 - 30
    func test_GameP1P2P1P2P1P1_Player1Wins_Player2Scores30() {
        // given
        let sut = getMockSUT()
        
        // when
        sut.player1Scores()
        sut.player2Scores()
        sut.player1Scores()
        sut.player2Scores()
        sut.player1Scores()
        sut.player1Scores()
        
        // then
        XCTAssertEqual(sut.player1.points, .win)
        XCTAssertEqual(sut.player2.points, .thirty)
    }
    
    // GameType2 = P2, P1, P2, P1, P2, P2
    // P1 - 30, P2 - Win
    func test_GameP2P1P2P1P2P2_Player2Wins_Player1Scores30() {
        // given
        let sut = getMockSUT()
        
        // when
        sut.player2Scores()
        sut.player1Scores()
        sut.player2Scores()
        sut.player1Scores()
        sut.player2Scores()
        sut.player2Scores()
        
        // then
        XCTAssertEqual(sut.player1.points, .thirty)
        XCTAssertEqual(sut.player2.points, .win)
    }
}

// Testing different advantage scenarios
extension TennisTests {
    
    // Game - P1, P2, P1, P2, P1, P2, P1
    // P1 - Deuce Advantage, P2 - 40
    func test_GameP1P2P1P2P1P2P1_Player1HasAdvantage() {
        // given
        let sut = getMockSUT()
        
        // when
        sut.player1Scores()
        sut.player2Scores()
        sut.player1Scores()
        sut.player2Scores()
        sut.player1Scores()
        sut.player2Scores()
        sut.player1Scores()
        
        // then
        XCTAssertEqual(sut.player1.points, .advantage)
        XCTAssertEqual(sut.player2.points, .forty)
    }
    
    // Game - P1, P2, P1, P2, P1, P2, P1, P2
    // P1 - 40, P2 - 40
    func test_GameP1P2P1P2P1P2P1P2_Player2TakesAdvantageFromPlayer1() {
        // given
        let sut = getMockSUT()
        
        // when
        sut.player1Scores()
        sut.player2Scores()
        sut.player1Scores()
        sut.player2Scores()
        sut.player1Scores()
        sut.player2Scores()
        sut.player1Scores()
        sut.player2Scores()
        
        // then
        XCTAssertEqual(sut.player1.points, .forty)
        XCTAssertEqual(sut.player2.points, .forty)
    }
    
    // Game - P1, P2, P1, P2, P1, P2, P1, P2, P1, P1
    // P1 - Win, P2 - 40
    func test_GameP1P2P1P2P1P2P1P2P1P1_Players1WinsAfterDeuce() {
        // given
        let sut = getMockSUT()
        
        // when
        sut.player1Scores()
        sut.player2Scores()
        sut.player1Scores()
        sut.player2Scores()
        sut.player1Scores()
        sut.player2Scores()
        sut.player1Scores()
        sut.player2Scores()
        sut.player1Scores()
        sut.player1Scores()
        
        // then
        XCTAssertEqual(sut.player1.points, .win)
        XCTAssertEqual(sut.player2.points, .forty)
    }
    
    // Game - P1, P2, P1, P2, P1, P2, P1, P2, P2, P2
    // P1 - 40, P2 - Win
    func test_GameP1P2P1P2P1P2P1P2P2P2_Players2WinsAfterDeuce() {
        // given
        let sut = getMockSUT()
        
        // when
        sut.player1Scores()
        sut.player2Scores()
        sut.player1Scores()
        sut.player2Scores()
        sut.player1Scores()
        sut.player2Scores()
        sut.player1Scores()
        sut.player2Scores()
        sut.player2Scores()
        sut.player2Scores()
        
        // then
        XCTAssertEqual(sut.player1.points, .forty)
        XCTAssertEqual(sut.player2.points, .win)
    }
}

// Testing score after each player scores
extension TennisTests {
    // Game - P1, P2, P1, P2, P1, P2, P1, P2, P2, P1, P1, P1
    // P1 - Wins, P2 - 40
    func test_GameP1P2P1P2P1P2P1P2P2P1P1P1_Players1WinsAfterDeuce() {
        // given
        let sut = getMockSUT()
        
        // when
        sut.player1Scores()
        assertEqual(sut: sut, player1Points: .fifteen, player2Points: .love)
        
        sut.player2Scores()
        assertEqual(sut: sut, player1Points: .fifteen, player2Points: .fifteen)
        
        sut.player1Scores()
        assertEqual(sut: sut, player1Points: .thirty, player2Points: .fifteen)
        
        sut.player2Scores()
        assertEqual(sut: sut, player1Points: .thirty, player2Points: .thirty)
        
        sut.player1Scores()
        assertEqual(sut: sut, player1Points: .forty, player2Points: .thirty)
        
        sut.player2Scores()
        assertEqual(sut: sut, player1Points: .forty, player2Points: .forty)
        
        sut.player1Scores()
        assertEqual(sut: sut, player1Points: .advantage, player2Points: .forty)
        
        sut.player2Scores()
        assertEqual(sut: sut, player1Points: .forty, player2Points: .forty)
        
        sut.player2Scores()
        assertEqual(sut: sut, player1Points: .forty, player2Points: .advantage)
        
        sut.player2Scores()
        assertEqual(sut: sut, player1Points: .forty, player2Points: .win)
    }
    
    func assertEqual(sut: TennisScoreEngine, player1Points: TennisScoreEngine.Points, player2Points: TennisScoreEngine.Points) {
        XCTAssertEqual(sut.player1.points, player1Points)
        XCTAssertEqual(sut.player2.points, player2Points)
    }
}
