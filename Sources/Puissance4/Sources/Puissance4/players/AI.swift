import Foundation

public class AI : Player {
    
    override public func play(Board board: Board) -> Int {
        var tab: [Int] = []
        for i in 0 ..< board.board[0].count {
            if !board.isColumnFull(Column: i) {
                tab.append(i)
            }
        }
        return tab.randomElement()!
    }
}
