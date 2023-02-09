import Foundation

public class CheckDiagonals : CheckVictory, LegacyRule {
    
    public func getStatusGame(Grid grid: [[Int?]], PiecesToAlign nbPieces: Int) -> Status {
        let r = checkDiagonalLeft(Grid: grid, PiecesToAlign : nbPieces)
        if (r != Status.CONTINUE) {
            return r;
        }
        return checkDiagonalRight(Grid: grid, PiecesToAlign : nbPieces)
    }
    
    private func checkDiagonalRight(Grid grid: [[Int?]], PiecesToAlign nbPieces: Int) -> Status {
        Status.CONTINUE
    }
    
    private func checkDiagonalLeft(Grid grid: [[Int?]], PiecesToAlign nbPieces: Int) -> Status {
        Status.CONTINUE
    }
}
