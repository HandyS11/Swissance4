import Foundation

public protocol LegacyRule {
    func getStatusGame(Grid grid: [[Int?]], PiecesToAlign nbPieces: Int) -> Status
}
