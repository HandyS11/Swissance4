import Foundation

public class CheckDiagonals : CheckVictory, LegacyRule {
    
    public func getStatusGame(Grid grid: [[Int?]], PiecesToAlign nbPieces: Int) -> Status {
        let r = checkDiagonal_45(Grid: grid, PiecesToAlign : nbPieces)
        if (r != Status.CONTINUE) {
            return r;
        }
        return checkDiagonal_135(Grid: grid, PiecesToAlign : nbPieces)
    }
    
    // 0° means the NORTH (alias top)
    // Theses algorithm sucks but do the job (basicaly it's a protocol so no problem)
    
    private func checkDiagonal_45(Grid grid: [[Int?]], PiecesToAlign nbPieces: Int) -> Status {
        let c = grid[0].count
        for i in 0...(grid.count - nbPieces) {
            for j in 0...(c - nbPieces) {
                var tab: [Int?] = []
                let y = (c-1) - j
                for n in 0..<nbPieces {
                    tab.append(grid[i+n][y-n])
                }
                let r = ckeckVictory(Entry: tab, PiecesToAlign: nbPieces)
                if r != Status.CONTINUE {
                    return r;
                }
            }
        }
        return Status.CONTINUE
    }
    
    private func checkDiagonal_135(Grid grid: [[Int?]], PiecesToAlign nbPieces: Int) -> Status {
        for i in 0...(grid.count - nbPieces) {
            for j in 0...(grid[0].count - nbPieces) {
                var tab: [Int?] = []
                for n in 0..<nbPieces {
                    tab.append(grid[i+n][j+n])
                }
                let r = ckeckVictory(Entry: tab, PiecesToAlign: nbPieces)
                if r != Status.CONTINUE {
                    return r;
                }
            }
        }
        return Status.CONTINUE
    }
}
