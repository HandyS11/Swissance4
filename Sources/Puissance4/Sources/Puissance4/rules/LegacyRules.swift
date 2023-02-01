import Foundation

public protocol LegacyRules : Rules {
    func isGameOver() -> Status
    func ckeckVictory(Entry entry: [Int?]) -> Status
    func checkRowsAndColumns() -> Status
    func checkDiagonals() -> Status
    func checkThreeDirections() -> Status
}
