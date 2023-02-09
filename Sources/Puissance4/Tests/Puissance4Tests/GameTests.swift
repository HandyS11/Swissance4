import XCTest
@testable import Puissance4

final class GameTests: XCTestCase {
    
    func testsGameWithParams() throws {
        func expect(Rows nbRows: Int, Columns nbColumns: Int, PiecesToAlign nbPieces: Int, Players players: [Player], Rules rules: [LegacyRule], Nil nilValue: Bool) {
            let game = Game(NumberRows: nbRows, NumberColumns: nbColumns, NumberPieceToAlign: nbPieces, Players: players, Rules: rules, Displayer: CommandLineToolDisplayer())
            if nilValue {
                XCTAssertNil(game)
            }
            else {
                XCTAssertNotNil(game)
            }
        }
        expect(Rows: 6, Columns: 7, PiecesToAlign: 4, Players: [AI(Id: 1, Name: "AI 1"), AI(Id: 2, Name: "AI 2")], Rules: [CheckRows(), CheckColumns(), CheckDiagonals()], Nil: false)
        expect(Rows: 3, Columns: 7, PiecesToAlign: 4, Players: [AI(Id: 1, Name: "AI 1"), AI(Id: 2, Name: "AI 2")], Rules: [CheckRows(), CheckColumns(), CheckDiagonals()], Nil: true)
        expect(Rows: 6, Columns: 3, PiecesToAlign: 4, Players: [AI(Id: 1, Name: "AI 1"), AI(Id: 2, Name: "AI 2")], Rules: [CheckRows(), CheckColumns(), CheckDiagonals()], Nil: true)
        expect(Rows: 6, Columns: 7, PiecesToAlign: 7, Players: [AI(Id: 1, Name: "AI 1"), AI(Id: 2, Name: "AI 2")], Rules: [CheckRows(), CheckColumns(), CheckDiagonals()], Nil: true)
        expect(Rows: 6, Columns: 7, PiecesToAlign: 4, Players: [AI(Id: 1, Name: "AI 1")], Rules: [CheckRows(), CheckColumns(), CheckDiagonals()], Nil: true)
        expect(Rows: 6, Columns: 7, PiecesToAlign: 4, Players: [AI(Id: 1, Name: "AI 1"), AI(Id: 2, Name: "AI 2")], Rules: [], Nil: true)
    }
}
