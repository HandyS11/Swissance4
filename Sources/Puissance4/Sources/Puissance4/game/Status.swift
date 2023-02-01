import Foundation

public enum Status : Comparable {
    case UNKNOW
    case CONTINUE
    case ENDED(REASON)
}

public enum REASON : Comparable {
    case DEAD_END
    case PLAYER_ID(Int)
}
