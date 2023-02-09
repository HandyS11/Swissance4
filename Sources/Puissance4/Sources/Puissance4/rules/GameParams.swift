import Foundation

protocol GameParams {
    var players: [Player] { get }
    var board: Board { get }
    var displayer: Displayer { get }
    var rules: [LegacyRule] { get }
}
