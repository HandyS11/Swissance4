import Foundation

public class Game {

    let player1: Player
    let player2: Player
    var nbRound: Int = 1
    var board: Board
    
    public init() {
        player1 = Human(Id: 1, Name: "Human", Scanner: Reader())
        player2 = AI(Id: 2, Name: "AI")
        board = Board()!
    }
    
    public init(player1: Player, player2: AI, board: Board) {
        self.player1 = player1
        self.player2 = player2
        self.board = board
    }
    
    public func playGame() {
        print(Displayer.buildGrid(Grille: board.description, Columns: board.nbColumns))
        var r = doRound()
        while r == Status.CONTINUE {
            print(Displayer.buildGrid(Grille: board.description, Columns: board.nbColumns))
            r = doRound()
        }
        print(Displayer.buildGrid(Grille: board.description, Columns: board.nbColumns))
        print(r)
    }
    
    private func doRound() -> Status {
        if nbRound%2 != 0 {
            var result = board.putPiece(Column: player1.play(Board: board), Player: 1)
            while !result {
                result = board.putPiece(Column: player1.play(Board: board), Player: 1)
            }
        }
        else {
            var result = board.putPiece(Column: player2.play(Board: board), Player: 2)
            while !result {
                result = board.putPiece(Column: player2.play(Board: board), Player: 2)
            }
        }
        nbRound += 1
        return board.checkThreeDirections()
    }
}
