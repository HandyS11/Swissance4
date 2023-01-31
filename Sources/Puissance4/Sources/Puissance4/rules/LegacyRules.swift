import Foundation

protocol LegacyRules {
    var player1: Player { get }
    var player2: AI { get }
    func isGameOver() -> Status
    func ckeckVictory(Entry entry: [Int?]) -> Status
    func checkRowsAndColumns() -> Status
    func checkDiagonals() -> Status
}
