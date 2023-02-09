import XCTest
@testable import Puissance4

final class PlayerTests: XCTestCase {
    
    let grid1: [[Int?]] = [
                [nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil]
                ]
    let grid2: [[Int?]] = [
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]
                ]
    let grid3: [[Int?]] = [
                [nil, nil, nil, nil],
                [nil, nil, nil, nil],
                [nil, nil, nil, nil],
                [nil, nil, nil, nil]
                ]
    let grid4: [[Int?]] = [
                [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
                ]
    
    func testsPlayerDefault() throws {
        let player = Player(Id: 1, Name: "name", Carac: "#")
        XCTAssertNotNil(player)
    }
    
    func testPlayerPlay() throws {
        let player = Player(Id: 1, Name: "name")
        func expect(Grid grid: [[Int?]], Max max: Int) {
            let board = Board(Grid: grid)!
            
            XCTAssertLessThanOrEqual(player.play(Board: board), max)
            XCTAssertGreaterThanOrEqual(player.play(Board: board), 1)
        }
        expect(Grid: grid1, Max: 6)
        expect(Grid: grid2, Max: 7)
        expect(Grid: grid3, Max: 4)
        expect(Grid: grid4, Max: 13)
    }
}
