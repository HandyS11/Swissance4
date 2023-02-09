import Foundation

import XCTest
@testable import Puissance4

final class CheckRowsTests: XCTestCase {
    
    let grid1: [[Int?]] = [
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]
                ]
    
    let grid2: [[Int?]] = [
                [1, 1, 1, 1, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]
                ]
    
    let grid3: [[Int?]] = [
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, 1, 1, 1, 1]
                ]
    
    let grid4: [[Int?]] = [
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, 2, 2, 2, 2, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]
                ]
    
    func testRowsWithGrid() throws {
        func expect(Grid grid: [[Int?]], PiecesToAlign nb: Int, Result r: Status) {
            let c = CheckRows()
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
        
        expect(Grid: grid1, PiecesToAlign: 3, Result: Status.CONTINUE)
        expect(Grid: grid2, PiecesToAlign: 3, Result: Status.ENDED(REASON.PLAYER_ID(1)))
        expect(Grid: grid3, PiecesToAlign: 3, Result: Status.ENDED(REASON.PLAYER_ID(1)))
        expect(Grid: grid4, PiecesToAlign: 3, Result: Status.ENDED(REASON.PLAYER_ID(2)))
    }
}
