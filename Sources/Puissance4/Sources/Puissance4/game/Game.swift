import Foundation

public class Game {

    var players: [Player] = []
    var nbRound: Int = 1
    var board: Board
    
    public init() {
        players.append(Human(Id: 1, Name: "Human", Scanner: Reader()))
        players.append(AI(Id: 2, Name: "AI"))
        board = Board()!
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
        
        for player in players {
            var result = board.putPiece(Column: player.play(Board: board), Player: player.id)
            while !result {
                result = board.putPiece(Column: player.play(Board: board), Player: player.id)
            }
        }
        nbRound += 1
        return board.checkThreeDirections()
    }
}
