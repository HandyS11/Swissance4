import XCTest
@testable import Puissance4

final class BoardTests: XCTestCase {
    
    func testsBoardDefault() throws {
        let board: Board? = Board()
        XCTAssertNotNil(board)
        XCTAssertEqual(board!.nbRows, 6)
        XCTAssertEqual(board!.nbColumns, 7)
    }
    
    func testsBoardWithParams() throws {
        func expect(Rows nbRows: Int, Columns nbColumns: Int, Nil nilValue: Bool) {
            let board: Board? = Board(Rows: nbRows, Columns: nbColumns)
            if nilValue {
                XCTAssertNil(board)
                return
            }
            XCTAssertNotNil(board)
            XCTAssertEqual(board!.nbRows, nbRows)
            XCTAssertEqual(board!.nbColumns, nbColumns)
        }
        expect(Rows: 4, Columns: 4, Nil: false)
        expect(Rows: 10, Columns: 10, Nil: false)
        expect(Rows: 0, Columns: 0, Nil: true)
    }
}
