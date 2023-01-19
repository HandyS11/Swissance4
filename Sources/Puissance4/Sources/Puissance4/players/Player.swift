import Foundation

public class Player : CustomStringConvertible {
    public var description: String {
        return String(format: "Player n°%d : %s", id, name)
    }
    
    public let id: Int
    public let name: String
    
    public init(Id id: Int, Name name: String) {
        self.id = id
        self.name = name
    }
    
    public func play(Board board: [[Int?]]) -> Int { return -1 }
}
