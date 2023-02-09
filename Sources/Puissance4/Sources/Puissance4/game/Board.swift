import Foundation

/// Board class
///
/// #Notes
/// This class contains the grid of the game and all the methods working with it
public struct Board : Params, CustomStringConvertible {
    
    public private(set) var nbColumns: Int
    public private(set) var nbRows: Int
    public private(set) var nbPiecesToAlign: Int
    public let maxRound: Int
    public private(set) var board: [[Int?]]
    
    public var description: String {
        var str: String = String()
        
        for row in board.reversed() {
            str.append("│ ")
            for cell in row {
                if cell != nil {
                    str.append("\(cell!) \u{007C} ")
                }
                else {
                    str.append("  \u{007C} ")
                }
            }
            str.append("\n")
        }
        return str
    }

    /// Board constructor
    ///
    ///  Board constructor with
    ///  - Parameter Rows: Number of rowss
    ///  - Parameter Columns: Number of columns
    ///  - Parameter PiecesToAlign: Number of piece to align to win the game
    ///
    ///  # Notes
    ///   Check if the number of row is superior or equal to 6
    ///   Check if the number of column is superior or equal to 7
    ///   Check if the number of piece to align to win is superior or equal to 4
    ///   It also check if the number of piece to align is coherent
    public init?(Rows rows: Int = 6, Columns columns: Int = 7, PiecesToAlign nbPieces: Int = 4) {
        guard rows >= 4 && columns >= 4 else { return nil }
        guard nbPieces <= rows && nbPieces <= columns else { return nil }
        nbRows = rows
        nbColumns = columns
        nbPiecesToAlign = nbPieces
        maxRound = rows * columns
        board = Array(repeating: Array(repeating: nil, count: columns), count: rows)
    }
    
    /// Board constructor
    ///
    ///  Board constructor with
    ///  - Parameter Grid: Grid of the game
    ///  - Parameter PiecesToAlign: Number of piece to align to win the game
    ///
    ///  # Notes
    ///   Check if the grid dimensions are coherent
    ///   Check if the number of piece to align to win is superior or equal to 4
    ///   It also check if the number of piece to align is coherent
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
    
    /// I decided to only check the top element of the grid for optimisation since it shall not be possible to get a non-contigus column with the basics rules.
    public func isColumnFull(Column column: Int) -> Bool {
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
        guard !isColumnFull(Column: column-1) else { return false }
        for i in 0 ..< nbRows {
            if board[i][column-1] == nil {
                board[i][column-1] = p
                return true
            }
        }
        return false
    }
}
