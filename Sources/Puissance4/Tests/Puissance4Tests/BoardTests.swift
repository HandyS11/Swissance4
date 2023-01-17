import XCTest
@testable import Puissance4

final class BoardTests: XCTestCase {
    
    func initBoardDefault() throws {
        let board: Board? = Board()
        XCTAssertEqual(board!.nbRows, 7)
        XCTAssertEqual(board!.nbColumns, 7)
    }
    
    func initBoardWithParams() throws {
        let board: Board? = Board(Rows: 8, Columns: 10)
        XCTAssertEqual(board!.nbRows, 8)
        XCTAssertEqual(board!.nbColumns, 10)
    }
}
