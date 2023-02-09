import Foundation

public class CheckColumns : CheckVictory, LegacyRule {
    
    public func getStatusGame(Grid grid: [[Int?]], PiecesToAlign nbPieces: Int) -> Status {
        for i in 0 ..< grid[0].count {
            var tab: [Int?] = []
            for j in 0 ..< grid.count {
                tab.append(grid[j][i])
            }
            let r = ckeckVictory(Entry: tab, PiecesToAlign: nbPieces)
            if r != Status.CONTINUE {
                return r;
            }
        }
        return Status.CONTINUE
    }
}
