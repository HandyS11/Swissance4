import Foundation

public protocol LegacyRules : Rules {
    func isGameOver() -> Status
    func ckeckVictory(Entry entry: [Int?]) -> Status
    func checkRows() -> Status
    func checkColumns() -> Status
    func checkDiagonals() -> Status
}
