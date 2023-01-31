import Foundation

public class Game : LegacyRules {
    var nbRows: Int
    var nbColumns: Int
    var nbPiecesToAlign: Int
    
    let board: Board?
    
    var player1: Player
    var player2: AI
    
    public init?(nbRows: Int = 6, nbColumns: Int = 7, nbPiecesToAlign: Int = 4) {
        guard nbRows >= 4 && nbColumns >= 4 else {
            return nil
        }
        self.nbRows = nbRows
        self.nbColumns = nbColumns
        self.nbPiecesToAlign = nbPiecesToAlign
        self.board = Board(Rows: nbRows, Columns: nbColumns)
        self.player1 = Player(Id: 1, Name: "Player1")
        self.player2 = AI(Id: 2, Name: "AI")
    }
    
    func isGameOver() -> Status {
        if board!.isBoardFull() {
            return Status.ENDED(REASON.DEAD_END)
        }
        let reason = checkRowsAndColumns()
        if reason != Status.CONTINUE {
            return reason
        }
        return checkDiagonals()
    }
    
    func checkRowsAndColumns() -> Status {
        // columns
        for i in 0 ..< nbColumns {
            var r = ckeckVictory(Entry: board!.board[i])
            if r != Status.CONTINUE {
                return r;
            }
            
            // rows
            var tab: [Int?] = []
            for j in 0 ..< nbRows {
                tab.append(board!.board[i][j])
            }
            r = ckeckVictory(Entry: tab)
            if r != Status.CONTINUE {
                return r;
            }
        }
        return Status.CONTINUE
    }
    
    func checkDiagonals() -> Status {
        Status.CONTINUE
    }
    
    func ckeckVictory(Entry entry: [Int?]) -> Status {
        if entry.count < nbPiecesToAlign {
            return Status.CONTINUE
        }
        var strick = 1
        var lastCarac = -1
        for i in 0 ..< entry.count {
            let c = entry[i]
            if c != nil {
                if c == lastCarac {
                    strick += 1
                }
                else {
                    lastCarac = c!
                }
            }
            else {
                strick = 0
                lastCarac = -1
            }
            
            if strick >= nbPiecesToAlign {
                return Status.ENDED(REASON.PLAYER_ID(lastCarac))
            }
        }
        return Status.CONTINUE
    }
}
