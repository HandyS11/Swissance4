import Foundation

protocol Rules {
    var nbRows: Int { get }
    var nbColumns: Int { get }
    var nbPiecesToAlign: Int { get }
    // isGameOver() -> Status (cases winner) // utiliser un enum
    mutating func isGameOver()
}
