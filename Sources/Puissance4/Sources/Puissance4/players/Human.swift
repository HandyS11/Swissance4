import Foundation

public class Human : Player {
    
    let scanner: Scanner

    public init(Id id: Int, Name name: String, Scanner scanner: Scanner) {
        self.scanner = scanner
        super.init(Id: id, Name: name)
    }
    
    public init(Id id: Int, Name name: String, Carac carac: String, Scanner scanner: Scanner) {
        self.scanner = scanner
        super.init(Id: id, Name: name, Carac: carac)
    }
    
    override public func play(Board board: Board) -> Int {
        var choice: Int = scanner.getInt()
        while choice < 1 || choice > board.board[0].count {
            print("Your play is impossible, please choose a valid column!")
            choice = scanner.getInt()
        }
        return choice
    }
}
