import Foundation
import Puissance4

//var board: Board? = Board(Rows: 9, Columns: 9)
var board: Board? = Board()
print(board!.toString())
var b: Bool
b = board!.putPiece(Column: 2, Player: 1)
b = board!.putPiece(Column: 2, Player: 2)
print(board!.toString())
