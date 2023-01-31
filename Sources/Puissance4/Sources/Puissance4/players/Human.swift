import Foundation

public class Human : Player {

    override public func play(Board board: [[Int?]]) -> Int {
        var choice: Int = Reader.getInt()
        while choice < 1 || choice > board[0].count {
            choice = Reader.getInt()
        }
        return choice
    }
}
