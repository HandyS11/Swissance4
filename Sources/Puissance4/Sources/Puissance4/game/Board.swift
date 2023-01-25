import Foundation

public struct Board : CustomStringConvertible {
    
    public let nbColumns: Int
    public let nbRows: Int
    public let maxRound: Int
    public private(set) var board: [[Int?]]
    private static let descriptionMapper : [Int? : String] = [nil: "  │ ", 1: "X │ ", 2: "O │ "]
    
    public var description: String {
        var str: String = String()
        str.append(Decorator.addDecoration(Columns: nbColumns))
        
        for row in board.reversed() {
            str.append("│ ")
            for cell in row {
                str.append("\(String(describing: Board.descriptionMapper[cell] ?? "  \u{007C} "))")
            }
            str.append("\n")
        }
        str.append(Decorator.addDecoration(Columns: nbColumns))
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
        guard grid.count >= 4 && grid[0].count >= 4 else { return nil}
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
    
    mutating func isGameOver() {
        
    }
    
    public func toString(ShowColumn b: Bool = true) -> String {
        var str: String = Decorator.gameName()
        str.append(description)
        
        if b {
            str.append("│")
            for k in 1 ... nbColumns {
                str.append(String(format: " %d │", k))
            }
            str.append("\n")
            str.append(Decorator.addDecoration(Columns: nbColumns))
        }
        return str
    }
}
