import Foundation

public class AI : Player {
    
    override public func play(Board board: Board) -> Int {
        var tab: [Int] = []
        for i in 1 ... board.board[0].count {
            if !board.isColumnFull(Column: i-1) {
                tab.append(i)
                print(i)
            }
        }
        return tab.randomElement()!
    }
}
