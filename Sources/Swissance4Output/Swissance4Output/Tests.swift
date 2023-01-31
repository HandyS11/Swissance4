import Foundation
import Puissance4

/// Construct a Nounours
///
///  Construct a Nounours using struct
///  - Parameter name: A name
///  - Parameter birthdate: A birthdate
///
///  # Notes
///  Some notes
public struct Nounours : Equatable {
    public var name: String
    public var birthdate: Date
    
    public static func == (_ lhs: Nounours, _ rhs: Nounours) -> Bool {
        lhs.name == rhs.name
    }
}

public class Nounours2 : Hashable {
    public var name: String
    public var birthdate: Date
    
    public init(name: String, birthdate: Date) {
        self.name = name
        self.birthdate = birthdate
    }
    
    public static func == (_ lhs: Nounours2, _ rhs: Nounours2) -> Bool {
        lhs.name == rhs.name
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(birthdate)
    }
}

let n1 = Nounours(name: "NounoursA", birthdate: Date(2022, 05, 26)!)
let n2 = Nounours(name: "NouhoursB", birthdate: Date(2022, 07, 23)!)
