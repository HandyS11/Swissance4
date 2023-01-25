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

/*extension Date {
    static let formatter = DateFormatter()
    
    init?(_ year: Int, _ month: Int, _ day: Int) {
        guard year >= 0 && month >= 1 && month <= 12 && day >= 1 && day <= 31 else {
            return nil
        }
        Date.formatter.dateFormat = "yyyy-MM-dd"
        if let temp = Date.formatter.date(from: String(format: "%d-%d-%d", year, month, day)) {
            self = temp
            return
        }
        return nil
    }
}*/

let n1 = Nounours(name: "NounoursA", birthdate: Date(2022, 05, 26)!)
let n2 = Nounours(name: "NouhoursB", birthdate: Date(2022, 07, 23)!)
