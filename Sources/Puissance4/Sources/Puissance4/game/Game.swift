import Foundation

public class Game : GameParams {

    var nbRound: Int = 0
    var players: [Player]
    var board: Board
    var displayer: Displayer
    var rules: [LegacyRule]
    
    public init?(NumberRows nbR: Int = 6, NumberColumns nbC: Int = 7, NumberPieceToAlign nbP: Int = 4, Players players: [Player], Rules rules: [LegacyRule], Displayer disp: Displayer) {
        guard nbR >= 4 && nbC >= 4 else { return nil }
        guard nbP <= nbR && nbP <= nbC else { return nil }
        guard players.count >= 2 else { return nil }
        guard rules.count >= 1 else { return nil }
        
        let board = Board(Rows: nbR, Columns: nbC, PiecesToAlign: nbP)
        guard board != nil else { return nil }  // Should never happend
        
        self.players = players
        self.displayer = disp
        self.rules = rules
        self.board = board!
    }
    
    public func playGame() {
        var r = doRound()
        while r == Status.CONTINUE {
            r = doRound()
        }
        
        displayer.finalRound()
        displayer.buildEnhanceGrid(Grid: board.board.reversed(), Columns: board.nbColumns, ShowColumn: true)
        
        if (r == Status.ENDED(REASON.DEAD_END)) {
            displayer.deadEnd()
        }
        else {
            // TODO: Find how to return the name od the player designated by his id in an array
            //displayer.playerWinDisplay(Player: players.first(where: {})!)
            print("Vitory of \(r) in \(nbRound) rounds!")   //TMP
        }
    }
    
    private func doRound() -> Status {
        
        var status: Status = Status.CONTINUE
        for player in players {
            displayer.buildEnhanceGrid(Grid: board.board.reversed(), Columns: board.nbColumns, ShowColumn: true)
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
            displayer.displaRound(Round: nbRound+1)
        }
        return status
    }
}
