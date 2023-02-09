import Foundation

import XCTest
@testable import Puissance4

final class CheckDiagonalsTests: XCTestCase {
    
    let grid1: [[Int?]] = [
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]
                ]
    
    let grid2: [[Int?]] = [
                [1, nil, nil, nil, nil, nil, nil],
                [nil, 1, nil, nil, nil, nil, nil],
                [nil, nil, 1, nil, nil, nil, nil],
                [nil, nil, nil, 1, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]
                ]
    
    let grid2bis: [[Int?]] = [
                [nil, nil, nil, nil, nil, nil, 1],
                [nil, nil, nil, nil, nil, 1, nil],
                [nil, nil, nil, nil, 1, nil, nil],
                [nil, nil, nil, 1, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]
                ]
    
    let grid3: [[Int?]] = [
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, 1, nil, nil, nil],
                [nil, nil, nil, nil, 1, nil, nil],
                [nil, nil, nil, nil, nil, 1, nil],
                [nil, nil, nil, nil, nil, nil, 1]
                ]
    
    let grid3bis: [[Int?]] = [
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, 1, nil, nil, nil],
                [nil, nil, 1, nil, nil, nil, nil],
                [nil, 1, nil, nil, nil, nil, nil],
                [1, nil, nil, nil, nil, nil, nil]
                ]
    
    let grid4: [[Int?]] = [
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [2, nil, nil, nil, nil, nil, nil],
                [nil, 2, nil, nil, nil, nil, nil],
                [nil, nil, 2, nil, nil, nil, nil],
                [nil, nil, nil, 2, nil, nil, nil]
                ]
    
    let grid4bis: [[Int?]] = [
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, 2],
                [nil, nil, nil, nil, nil, 2, nil],
                [nil, nil, nil, nil, 2, nil, nil],
                [nil, nil, nil, 2, nil, nil, nil]
                ]
    
    func testDiagonals_135WithGrid() throws {
        func expect(Grid grid: [[Int?]], PiecesToAlign nb: Int, Result r: Status) {
            let c = CheckDiagonals()
            XCTAssertEqual(c.getStatusGame(Grid: grid, PiecesToAlign: nb), r)
        }
        expect(Grid: grid1, PiecesToAlign: 4, Result: Status.CONTINUE)
        expect(Grid: grid2, PiecesToAlign: 4, Result: Status.ENDED(REASON.PLAYER_ID(1)))
        expect(Grid: grid3, PiecesToAlign: 4, Result: Status.ENDED(REASON.PLAYER_ID(1)))
        expect(Grid: grid4, PiecesToAlign: 4, Result: Status.ENDED(REASON.PLAYER_ID(2)))
        
        expect(Grid: grid1, PiecesToAlign: 5, Result: Status.CONTINUE)
        expect(Grid: grid2, PiecesToAlign: 5, Result: Status.CONTINUE)
        expect(Grid: grid3, PiecesToAlign: 5, Result: Status.CONTINUE)
        expect(Grid: grid4, PiecesToAlign: 5, Result: Status.CONTINUE)
        
        expect(Grid: grid2bis, PiecesToAlign: 5, Result: Status.CONTINUE)
        expect(Grid: grid3bis, PiecesToAlign: 5, Result: Status.CONTINUE)
        expect(Grid: grid4bis, PiecesToAlign: 5, Result: Status.CONTINUE)
        
        // Kinda useless but fine
        expect(Grid: grid1, PiecesToAlign: 3, Result: Status.CONTINUE)
        expect(Grid: grid2, PiecesToAlign: 3, Result: Status.ENDED(REASON.PLAYER_ID(1)))
        expect(Grid: grid3, PiecesToAlign: 3, Result: Status.ENDED(REASON.PLAYER_ID(1)))
        expect(Grid: grid4, PiecesToAlign: 3, Result: Status.ENDED(REASON.PLAYER_ID(2)))
    }
    
    func testDiagonals_35WithGrid() throws {
        func expect(Grid grid: [[Int?]], PiecesToAlign nb: Int, Result r: Status) {
            let c = CheckDiagonals()
            XCTAssertEqual(c.getStatusGame(Grid: grid, PiecesToAlign: nb), r)
        }
        expect(Grid: grid2bis, PiecesToAlign: 4, Result: Status.ENDED(REASON.PLAYER_ID(1)))
        expect(Grid: grid3bis, PiecesToAlign: 4, Result: Status.ENDED(REASON.PLAYER_ID(1)))
        expect(Grid: grid4bis, PiecesToAlign: 4, Result: Status.ENDED(REASON.PLAYER_ID(2)))
        
        // Kinda useless but fine
        expect(Grid: grid2bis, PiecesToAlign: 3, Result: Status.ENDED(REASON.PLAYER_ID(1)))
        expect(Grid: grid3bis, PiecesToAlign: 3, Result: Status.ENDED(REASON.PLAYER_ID(1)))
        expect(Grid: grid4bis, PiecesToAlign: 3, Result: Status.ENDED(REASON.PLAYER_ID(2)))
    }
}
