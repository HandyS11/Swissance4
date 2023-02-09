import Foundation

public class Player : CustomStringConvertible {
    
    public var description: String {
        "\(carac) - \(name)"
    }
    
    public let id: Int
    public let name: String
    public let carac: String    // Not used yet
    
    public init(Id id: Int, Name name: String, Carac carac: String) {
        self.id = id
        self.carac = carac
        self.name = name
    }
    
    public init(Id id: Int, Name name: String) {
        self.id = id
        self.carac = String(id)
        self.name = name
    }
    
    public func play(Board board: Board) -> Int {
        Int.random(in: 1...board.board[0].count)
    }
}
