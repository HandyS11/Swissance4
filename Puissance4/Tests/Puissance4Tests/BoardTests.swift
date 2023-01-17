import XCTest
@testable import Puissance4

final class PBoardTests: XCTestCase {
    func testExample() throws {
        let board: Board? = Board(Rows: 8, Columns: 10)
        XCTAssertEqual(board!.nbRows, 10)
        XCTAssertEqual(board!.nbColumns, 8)
    }
}
