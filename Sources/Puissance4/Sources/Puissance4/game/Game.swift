import Foundation

public class Game : LegacyRules {
    
    var nbRows: Int
    var nbColumns: Int
    var nbPiecesToAlign: Int
    var board: Board?
    
    public init(Rows nbRows: Int, Columns nbColumns: Int, Pieces nbPieces: Int) {
        self.nbRows = nbRows
        self.nbColumns = nbColumns
        nbPiecesToAlign = nbPieces
        board = Board(Rows: nbRows, Columns: nbColumns)
    }
    
    func isGameOver() {
        
    }
}
