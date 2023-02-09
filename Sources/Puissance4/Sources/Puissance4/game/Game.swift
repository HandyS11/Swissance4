import Foundation

public class Game : GameParams {

    var players: [Player] = []
    var nbRound: Int = 0
    var board: Board
    var displayer: Displayer
    var rules: [LegacyRule]
    
    public init() {
        players.append(Human(Id: 1, Name: "Human", Scanner: Reader()))
        players.append(AI(Id: 2, Name: "AI"))
        board = Board()!
        displayer = Displayer()
        rules = [CheckRows(), CheckColumns(), CheckDiagonals()]
    }
    
    public func playGame() {
        print(displayer.buildEnhanceGrid(Grid: board.board.reversed(), Columns: board.nbColumns))
        var r = doRound()
        while r == Status.CONTINUE {
            print(displayer.buildEnhanceGrid(Grid: board.board.reversed(), Columns: board.nbColumns))
            r = doRound()
        }
        print(displayer.buildEnhanceGrid(Grid: board.board.reversed(), Columns: board.nbColumns))
        
        if (r == Status.ENDED(REASON.DEAD_END)) {
            print("Dead end game! Maybe rematch?")
        }
        else {
            // TODO: Find how to return the name od the player designated by his id in an array
            //print(displayer.getPlayerWinDisplay(Player: players.first(where: {})!))
            print("Vitory of \(r) in \(nbRound) rounds!")
        }
    }
    
    private func doRound() -> Status {
        
        var status: Status = Status.CONTINUE
        for player in players {
            if nbRound >= board.maxRound {
                return Status.ENDED(REASON.DEAD_END)
            }
            var result = board.putPiece(Column: player.play(Board: board), Player: player.id)
            while !result {
                result = board.putPiece(Column: player.play(Board: board), Player: player.id)
            }
            
            nbRound += 1
            for rule in rules {
                // I decided to check the whole grid each time in case of a special play or rule that said that pieces already placed can move, not because I'm tired of this ;)
                status = rule.getStatusGame(Grid: board.board, PiecesToAlign: board.nbPiecesToAlign)
                if (status != Status.CONTINUE) {
                    return status
                }
            }
        }
        return status
    }
}
