public protocol Displayer {
    
    func playerWinDisplay(Player player: Player)
    func deadEnd()
    func displaRound(Round r: Int)
    func finalRound()
    func buildGrid(Grid grid: String, Columns nbColumns: Int, ShowColumn b: Bool)
    func buildEnhanceGrid(Grid grid: [[Int?]], Columns nbColumns: Int, ShowColumn b: Bool)
}
