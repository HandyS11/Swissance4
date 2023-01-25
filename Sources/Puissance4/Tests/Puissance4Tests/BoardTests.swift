import XCTest
@testable import Puissance4

final class BoardTests: XCTestCase {
    
    func testsBoardDefault() throws {
        let board: Board? = Board()
        XCTAssertNotNil(board)
        XCTAssertEqual(board!.nbRows, 6)
        XCTAssertEqual(board!.nbColumns, 7)
        XCTAssertEqual(board!.nbPiecesToAlign, 4)
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
        expect(Rows: 3, Columns: 3, Nil: true)
        expect(Rows: 0, Columns: 0, Nil: true)
        expect(Rows: -5, Columns: 7, Nil: true)
        expect(Rows: 7, Columns: -5, Nil: true)
    }
    
    func testsBoardWithMoreParams() throws {
        func expect(Rows nbRows: Int, Columns nbColumns: Int, Pieces nbPieces: Int, Nil nilValue: Bool) {
            let board: Board? = Board(Rows: nbRows, Columns: nbColumns, Pieces: nbPieces)
            if nilValue {
                XCTAssertNil(board)
                return
            }
            XCTAssertNotNil(board)
            XCTAssertEqual(board!.nbRows, nbRows)
            XCTAssertEqual(board!.nbColumns, nbColumns)
            XCTAssertEqual(board!.nbPiecesToAlign, nbPieces)
        }
        expect(Rows: 6, Columns: 7, Pieces: 4, Nil: false)
        expect(Rows: 6, Columns: 7, Pieces: 7, Nil: false)
        expect(Rows: 6, Columns: 7, Pieces: 8, Nil: true)
        expect(Rows: 7, Columns: 6, Pieces: 8, Nil: true)
        expect(Rows: 6, Columns: 7, Pieces: -1, Nil: true)
    }
}
