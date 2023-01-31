import Foundation

enum Status : Comparable {
    case UNKNOW
    case CONTINUE
    case ENDED(REASON)
}

enum REASON : Comparable {
    case DEAD_END
    case PLAYER_ID(Int)
}
