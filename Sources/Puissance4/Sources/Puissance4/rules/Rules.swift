import Foundation

public protocol Rules {
    var nbRows: Int { get }
    var nbColumns: Int { get }
    var nbPiecesToAlign: Int { get }
}
