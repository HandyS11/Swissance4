import Foundation

public struct CommandLineToolDisplayer : Displayer {
    
    public init() {}
    
    // Not great for flexibility but as we said in french: "ça fait je job"
    private let descriptionMapper : [Int? : String] = [nil: "  │ ", 1: "X │ ", 2: "O │ ", 3: "@ │ ", 4: "* │ ", 5: "+ │ ", 6: "# │ "]
    
    private func gameName(Columns columns: Int = 7) -> String {
        var str: String = "\n"
        
        for _ in 1 ... columns-3 {
            str.append("  ")
        }
        str.append("Swissance 4\n")
        return str
    }
    
    private func addDecoration(Columns columns: Int) -> String {
        var s: String = String()
        for _ in 1 ... columns {
            s.append("――――")
        }
        s.append("―\n")
        return s
    }
    
    public func playerWinDisplay(Player player: Player) {
        print("The player \(player) won the game!")
    }
    
    public func deadEnd() {
        print("Dead end game! Maybe rematch?")
    }
    
    public func displaRound(Round r: Int) {
        print("\nRound n°\(r)\n")
    }
    
    public func finalRound() {
        print("\nFinal Grid:\n")
    }
    
    public func buildEnhanceGrid(Grid grid: [[Int?]], Columns nbColumns: Int, ShowColumn b: Bool = true) {
        var str: String = gameName(Columns: nbColumns)
        str.append(addDecoration(Columns: nbColumns))
        for row in grid {
            str.append("│ ")
            for cell in row {
                str.append("\(String(describing: descriptionMapper[cell] ?? "  │ "))")
            }
            str.append("\n")
        }
        str.append(addDecoration(Columns: nbColumns))
        
        if b {
            str.append(addCases(Columns: nbColumns))
        }
        print(str);
    }
    
    public func buildGrid(Grid grid: String, Columns nbColumns: Int, ShowColumn b: Bool = true) {
        var str: String = gameName(Columns: nbColumns)
        str.append(addDecoration(Columns: nbColumns))
        str += grid
        str.append(addDecoration(Columns: nbColumns))
        
        if b {
            str.append(addCases(Columns: nbColumns))
        }
        print(str)
    }
    
    private func addCases(Columns nbColumns: Int) -> String {
        var str = "│"
        for k in 1 ... nbColumns {
            str.append(String(format: " %d │", k))
        }
        str.append("\n")
        str.append(addDecoration(Columns: nbColumns))
        return str
    }
}
