import Foundation

struct Board {
    let nbColumns: Int
    let nbRows: Int
    var board: [[Int?]]     // Les indexes commencent en bas à gauche en commançant par les colonnes

    public init?(Rows rows: Int = 7, Columns columns: Int = 7) {
        if (rows < 4 || columns < 4) {
            return nil
        }
        nbColumns = columns
        nbRows = rows
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
    
    private func putPiece(Column column: Int, Player p: Int) -> Bool {
        var c = board[column-1][nbRows-1]
        if (c != nil) {
            c = p
            return true
        }
        return false
    }
    
    public func toString() -> String {
        var str: String = ""
        var v: Int?
        for i in nbRows-1 ... 0 {
            str += "| "
            for j in 0 ... nbColumns {
                v = board[i][j]
                if (v == nil){
                    str += "0 | "
                }
                else {
                    str += String(format: "%d |", v!)
                }
            }
        }
        return str
    }
}
