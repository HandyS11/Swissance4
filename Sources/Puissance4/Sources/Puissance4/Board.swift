import Foundation

public struct Board {
    let nbColumns: Int
    let nbRows: Int
    let maxRound: Int
    var board: [[Int?]]     // Les indexes commencent en bas à gauche en commançant par les colonnes

    public init?(Rows rows: Int = 7, Columns columns: Int = 7) {
        if (rows < 4 || columns < 4) {
            return nil
        }
        nbColumns = columns
        nbRows = rows
        maxRound = rows * columns
        board = Array(repeating: Array(repeating: nil, count: columns), count: rows)
    }
    
    private func isFull() -> Bool {
        var cf = 1
        for i in 1 ... nbColumns {
            if (isColumnFull(Column: i)) {
                cf += 1
            }
        }
        if (cf == nbColumns) {
            return true
        }
        return false
    }
    
    private func isColumnFull(Column column: Int) -> Bool {
        return board[column-1][nbRows-1] != nil
    }
    
    private func setPiece(Column column: Int, Row row: Int, Player p: Int) -> Bool {
        var c = board[column-1][row-1]
        if (c != nil) {
            c = p
            return true
        }
        return false
    }
    
    public func putPiece(Column column: Int, Player p: Int) -> Bool {
        if (isColumnFull(Column: column)) {
            return false
        }
        for i in 0 ... nbRows-1 {
            var c = board[column-1][i]
            if (c == nil) {
                c = p
                return true
            }
        }
        return false    // Should never been called because of the test
    }
    
    public func toString(ShowColumn b: Bool = true) -> String {
        var v: Int?
        var str: String = ""
        
        str = addDecoration(Text: str)
        
        // Each row
        for i in  1 ... nbRows {  // Why cannot do a -- loop ???
            str += "\u{007C} "
            // Each column
            for j in 1 ... nbColumns {
                v = board[nbRows - i][j-1]
                if (v == nil){
                    str += "  \u{007C} "
                }
                else {
                    str += String(format: "%d \u{007C}", v!)
                }
            }
            str += "\n" // endl
        }
        str = addDecoration(Text: str)
        
        // Columns
        if (b) {
            str += "\u{007C}"
            for k in 1 ... nbRows {
                str += String(format: " %d \u{007C}", k)
            }
            str += "\n"
            str = addDecoration(Text: str)
        }
        
        return str
    }
    
    private func addDecoration(Text str: String) -> String {
        var s: String = str
        for _ in 1 ... nbRows {
            s += "\u{2015}\u{2015}\u{2015}\u{2015}"
        }
        s += "\u{2015}\n"
        return s
    }
}
