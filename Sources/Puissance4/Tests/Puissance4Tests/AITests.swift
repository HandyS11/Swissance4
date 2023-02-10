import XCTest
@testable import Puissance4

final class AITests: XCTestCase {
    
    let grid1: [[Int?]] = [
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]
                ]
    let grid2: [[Int?]] = [
                [nil, nil, 1, nil, nil, 2, nil],
                [nil, nil, 1, nil, nil, 2, nil],
                [nil, nil, 2, nil, nil, 1, nil],
                [nil, nil, 2, nil, nil, 1, nil],
                [nil, nil, 1, nil, nil, nil, nil],
                [nil, nil, 1, nil, nil, nil, nil]
                ]
    let grid3: [[Int?]] = [
                [1, 2, 1, 2, 1, 2, 1],
                [1, 2, 1, 2, 1, 2, 1],
                [1, 2, 1, 2, 1, 2, 1],
                [2, 1, 2, 1, 2, 1, 2],
                [2, 1, 2, 1, 2, 1, 2],
                [2, 1, 2, 1, nil, 1, 2]
                ]
    let grid4: [[Int?]] = [
                [1, 2, 1, 2, 1, 2, 1],
                [1, 2, 1, 2, 1, 2, 1],
                [1, 2, 1, 2, 1, 2, 1],
                [2, 1, 2, 1, 2, 1, 2],
                [2, 1, 2, 1, 2, 1, 2],
                [2, nil, 2, 1, nil, 1, nil]
                ]
    
    func testsPlayWithBoard() throws {
        func expect(Grid grid: [[Int?]], Plays plays: [Int?]) {
            let ai = AI(Id: 1, Name: "name")
            
            XCTAssertTrue(plays.contains(ai.play(Board: Board(Grid: grid)!)))
        }
        expect(Grid: grid1, Plays: [ 1, 2, 3, 4, 5, 6, 7 ])
        expect(Grid: grid2, Plays: [ 1, 2, 4, 5, 6, 7 ])
        expect(Grid: grid3, Plays: [ 2, 5, 7])
    }
}
