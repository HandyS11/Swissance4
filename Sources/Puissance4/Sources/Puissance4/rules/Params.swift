import Foundation

public protocol Params {
    var nbRows: Int { get }
    var nbColumns: Int { get }
    var nbPiecesToAlign: Int { get }
}
