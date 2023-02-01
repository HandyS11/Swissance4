import Foundation

public struct Board : LegacyRules, CustomStringConvertible {
    
    public private(set) var nbColumns: Int
    public private(set) var nbRows: Int
    public private(set) var nbPiecesToAlign: Int
    public let maxRound: Int
    public private(set) var board: [[Int?]]
    private static let descriptionMapper : [Int? : String] = [nil: "  │ ", 1: "X │ ", 2: "O │ "]
    
    public var description: String {
        var str: String = String()
        
        for row in board.reversed() {
            str.append("│ ")
            for cell in row {
                str.append("\(String(describing: Board.descriptionMapper[cell] ?? "  \u{007C} "))")
            }
            str.append("\n")
        }
        return str
    }

    public init?(Rows rows: Int = 6, Columns columns: Int = 7, PiecesToAlign nbPieces: Int = 4) {
        guard rows >= 4 && columns >= 4 else { return nil }
        guard nbPieces <= rows && nbPieces <= columns else { return nil }
        nbRows = rows
        nbColumns = columns
        nbPiecesToAlign = nbPieces
        maxRound = rows * columns
        board = Array(repeating: Array(repeating: nil, count: columns), count: rows)
    }
    
    public init?(Grid grid: [[Int?]], PiecesToAlign nbPieces: Int = 4) {
        guard grid.count >= 4 && grid[0].count >= 4 else { return nil}
        guard nbPieces <= grid.count && nbPieces <= grid[0].count else { return nil }
        let result = grid.allSatisfy { $0.count == grid[0].count }
        guard result else { return nil }
        nbRows = grid.count
        nbColumns = grid[0].count
        nbPiecesToAlign = nbPieces
        maxRound = nbRows * nbColumns
        board = grid
    }
    
    public func isBoardFull() -> Bool {
        var cf = 0
        for i in 0 ..< nbColumns {
            if isColumnFull(Column: i) {
                cf += 1
            }
        }
        if (cf == nbColumns) {
            return true
        }
        return false
    }
    
    private func isColumnFull(Column column: Int) -> Bool {
        return board[nbRows-1][column] != nil
    }
    
    private mutating func setPiece(Row row: Int, Column column: Int, Player p: Int) -> Bool {
        guard (1...nbRows).contains(row) && (1...nbColumns).contains(column) else { return false }
        if board[row-1][column-1] == nil {
            board[row-1][column-1] = p
            return true
        }
        return false
    }
    
    public mutating func putPiece(Column column: Int, Player p: Int) -> Bool {
        guard column > 0 && column <= nbColumns else { return false }
        guard !isColumnFull(Column: column) else { return false }
        for i in 0 ..< nbRows {
            if board[i][column-1] == nil {
                board[i][column-1] = p
                return true
            }
        }
        return false
    }
    
    public func isGameOver() -> Status {
        let reason = checkRowsAndColumns()
        if reason != Status.CONTINUE {
            return reason
        }
        if isBoardFull() {
            return Status.ENDED(REASON.DEAD_END)
        }
        return checkDiagonals()
    }
    
    public func checkRowsAndColumns() -> Status {
        // columns
        for i in 0 ..< nbColumns {
            var r = ckeckVictory(Entry: board[i])
            if r != Status.CONTINUE {
                return r;
            }
            
            // rows
            var tab: [Int?] = []
            for j in 0 ..< nbRows {
                tab.append(board[i][j])
            }
            r = ckeckVictory(Entry: tab)
            if r != Status.CONTINUE {
                return r;
            }
        }
        return Status.CONTINUE
    }
    
    public func checkDiagonals() -> Status {
        Status.CONTINUE
    }
    
    public func ckeckVictory(Entry entry: [Int?]) -> Status {
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
