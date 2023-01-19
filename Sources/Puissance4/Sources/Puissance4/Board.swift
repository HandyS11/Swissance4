import Foundation

public struct Board : CustomStringConvertible {
    private static let descriptionMapper : [Int? : String] = [nil: "  │ ", 1: "X │ ", 2: "O │ "]
    
    public let nbColumns: Int
    public let nbRows: Int
    public let maxRound: Int
    var board: [[Int?]]
    
    public var description: String {
        var str: String = String()
        
        str = addDecoration(Text: str)
        
        // Each row
        for row in  board.reversed() {
            str.append("│ ")
            for cell in row {
                str.append("\(String(describing: Board.descriptionMapper[cell] ?? "  \u{007C} "))")
            }
            str.append("\n")
        }
        str = addDecoration(Text: str)
        return str
    }

    public init?(Rows rows: Int = 6, Columns columns: Int = 7) {
        if rows < 4 || columns < 4 {
            return nil
        }
        nbRows = rows
        nbColumns = columns
        maxRound = rows * columns
        board = Array(repeating: Array(repeating: nil, count: columns), count: rows)
    }
    
    public init?(Grid grid: [[Int?]]) {
        guard grid.count > 0 && grid[0].count > 0 else { return nil}
        let result = grid.allSatisfy { $0.count == grid[0].count }
        guard result else { return nil }
        nbRows = grid.count
        nbColumns = grid[0].count
        maxRound = nbRows * nbColumns
        board = grid
    }
    
    private func isFull() -> Bool {
        var cf = 1
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
        guard (1...nbRows).contains(row) && (1...nbColumns).contains(column) else {
            return false
        }
        if board[row-1][column-1] == nil {
            board[row-1][column-1] = p
            return true
        }
        return false
    }
    
    public mutating func putPiece(Column column: Int, Player p: Int) -> Bool {
        guard !isColumnFull(Column: column) else {
            return false
        }
        for i in 0 ..< nbRows {
            if board[i][column-1] == nil {
                board[i][column-1] = p
                return true
            }
        }
        return false
    }
    
    public func toString(ShowColumn b: Bool = true) -> String {
        var str: String = Displayer.gameName()
        str.append(description)
        
        // Columns
        if b {
            str.append("│")
            for k in 1 ... nbColumns {
                str.append(String(format: " %d │", k))
            }
            str.append("\n")
            str = addDecoration(Text: str)
        }
        return str
    }
    
    private func addDecoration(Text str: String) -> String {
        var s: String = str
        for _ in 1 ... nbColumns {
            s.append("\u{2015}\u{2015}\u{2015}\u{2015}")
        }
        s.append("\u{2015}\n")
        return s
    }
}
