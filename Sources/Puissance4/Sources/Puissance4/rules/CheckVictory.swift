import Foundation

public class CheckVictory {
    
    public init() {}
    
    public func ckeckVictory(Entry entry: [Int?], PiecesToAlign nb: Int) -> Status {
        if entry.count < nb {
            return Status.CONTINUE
        }
        var strick = 0
        var lastCarac: Int? = entry[0]
        for i in 0 ..< entry.count {
            let newCarac = entry[i]
            if newCarac == lastCarac && lastCarac != nil {
                strick += 1
            }
            else {
                strick = 1
                lastCarac = newCarac
            }
            if strick >= nb {
                return Status.ENDED(REASON.PLAYER_ID(lastCarac!))
            }
        }
        return Status.CONTINUE
    }
}
