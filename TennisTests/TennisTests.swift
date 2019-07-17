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
    }
    
    
}
