import Foundation

public class CheckRows : CheckVictory, LegacyRule {
    
    public func getStatusGame(Grid grid: [[Int?]], PiecesToAlign nbPieces: Int) -> Status {
        for i in 0 ..< grid.count {
            let r = ckeckVictory(Entry: grid[i], PiecesToAlign: nbPieces)
            if r != Status.CONTINUE {
                return r;
            }
        }
        return Status.CONTINUE
    }
}
