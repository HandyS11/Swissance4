import XCTest
@testable import Puissance4

final class BoardTests: XCTestCase {
    
    let grid1: [[Int?]] = [
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]
                ]
    let grid1bis: [[Int?]] = [
                [nil, nil, 1, nil, nil, 2, nil],
                [nil, nil, 1, nil, nil, 2, nil],
                [nil, nil, 2, nil, nil, 1, nil],
                [nil, nil, 2, nil, nil, 1, nil],
                [nil, nil, 1, nil, nil, nil, nil],
                [nil, nil, 1, nil, nil, nil, nil]
                ]
    let grid2: [[Int?]] = [
                [1, 2, 1, 2, 1, 2, 1],
                [1, 2, 1, 2, 1, 2, 1],
                [1, 2, 1, 2, 1, 2, 1],
                [2, 1, 2, 1, 2, 1, 2],
                [2, 1, 2, 1, 2, 1, 2],
                [2, 1, 2, 1, 2, 1, 2]
                ]
    let grid3: [[Int?]] = [
                [1, 2, 1, 2, 1, 2, 1],
                [1, 2, 1, 2, 1, 2, 1],
                [1, 2, 1, 2, 1, 2, 1],
                [2, 1, 2, 1, 2, 1, 2],
                [2, 1, 2, 1, 2, 1, 2],
                [2, 1, 2, 1, nil, 1, 2]
                ]
    
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
        func expect(Rows nbRows: Int, Columns nbColumns: Int, PiecesToAlign nbPieces: Int, Nil nilValue: Bool) {
            let board: Board? = Board(Rows: nbRows, Columns: nbColumns, PiecesToAlign: nbPieces)
            if nilValue {
                XCTAssertNil(board)
                return
            }
            XCTAssertNotNil(board)
            XCTAssertEqual(board!.nbRows, nbRows)
            XCTAssertEqual(board!.nbColumns, nbColumns)
            XCTAssertEqual(board!.nbPiecesToAlign, nbPieces)
        }
        expect(Rows: 4, Columns: 4, PiecesToAlign: 4, Nil: false)
        expect(Rows: 10, Columns: 10, PiecesToAlign: 4, Nil: false)
        expect(Rows: 10, Columns: 10, PiecesToAlign: 20, Nil: true)
        expect(Rows: 6, Columns: 7, PiecesToAlign: 7, Nil: true)
        expect(Rows: 7, Columns: 6, PiecesToAlign: 7, Nil: true)
    }
    
    func testsBoardWitGrid() throws {
        func expect(Grid grid: [[Int?]], Rows nbRows: Int, Columns nbColumns: Int) {
            let board: Board? = Board(Grid: grid)
            XCTAssertNotNil(board)
            XCTAssertEqual(board!.nbRows, nbRows)
            XCTAssertEqual(board!.nbColumns, nbColumns)
        }
        expect(Grid: grid1, Rows: 6, Columns: 7)
    }
    
    func testsBoardFull() throws {
        func expect(Grid grid: [[Int?]], IsFull full: Bool) {
            let board: Board? = Board(Grid: grid)
            XCTAssertNotNil(board)
            XCTAssertEqual(board!.isBoardFull(), full)
        }
        expect(Grid: grid1, IsFull: false)
        expect(Grid: grid2, IsFull: true)
        expect(Grid: grid3, IsFull: false)
    }
    
    func testBoardPutPiece() throws {
        func expect(Grid grid: [[Int?]], Column column: Int, ShouldPass bol: Bool) {
            var board: Board? = Board(Grid: grid)
            XCTAssertNotNil(board)
            XCTAssertEqual(board!.putPiece(Column: column, Player: 1), bol)
        }
        expect(Grid: grid1, Column: 2, ShouldPass: true)
        expect(Grid: grid1, Column: 4, ShouldPass: true)
        expect(Grid: grid1, Column: 0, ShouldPass: false)
        expect(Grid: grid1, Column: 10, ShouldPass: false)
        expect(Grid: grid1bis, Column: 3, ShouldPass: false)
        expect(Grid: grid1bis, Column: 6, ShouldPass: true)
    }
    
    func testBoardCheckVictory() throws {
        func expect(Rows r: Int, Columns c: Int, PiecesToAlign nb: Int, Tab tab: [Int?], Result result: Status) {
            let board: Board? = Board(Rows: r, Columns: c, PiecesToAlign: nb)
            XCTAssertNotNil(board)
            XCTAssertEqual(board!.ckeckVictory(Entry: tab), result)
        }
        expect(Rows: 6, Columns: 7, PiecesToAlign: 4, Tab: [nil, nil, nil, nil, nil, nil, nil], Result: Status.CONTINUE)
        expect(Rows: 6, Columns: 7, PiecesToAlign: 4, Tab: [1, 2, 1, 2, 2, 2, 1], Result: Status.CONTINUE)
        expect(Rows: 6, Columns: 7, PiecesToAlign: 4, Tab: [1, 1, 1, nil, 1, nil, nil], Result: Status.CONTINUE)
        expect(Rows: 6, Columns: 7, PiecesToAlign: 4, Tab: [1, 1, 1, 1, 2, nil, nil], Result: Status.ENDED(REASON.PLAYER_ID(1)))
        expect(Rows: 6, Columns: 7, PiecesToAlign: 4, Tab: [nil, 2, 2, 2, 2, nil, nil], Result: Status.ENDED(REASON.PLAYER_ID(2)))
        expect(Rows: 6, Columns: 7, PiecesToAlign: 4, Tab: [nil, 2, 1, 2, 2, 2, 2], Result: Status.ENDED(REASON.PLAYER_ID(2)))
        expect(Rows: 6, Columns: 7, PiecesToAlign: 4, Tab: [1, 1, 1, 2, 1, 2, 2], Result: Status.CONTINUE)
        
        expect(Rows: 6, Columns: 7, PiecesToAlign: 5, Tab: [nil, 2, 2, 2, 2, 2, nil], Result: Status.ENDED(REASON.PLAYER_ID(2)))
        expect(Rows: 6, Columns: 7, PiecesToAlign: 5, Tab: [1, 1, 1, 2, 2, 2, 2], Result: Status.CONTINUE)
    }
}
