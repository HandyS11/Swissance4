import Foundation

public struct Displayer {
    
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
            s.append("\u{2015}\u{2015}\u{2015}\u{2015}")
        }
        s.append("\u{2015}\n")
        return s
    }
    
    public func getPlayerWinDisplay(Player player: Player) -> String {
        String(format: "Le joueur : %d, se nommant : %s a gagné la partie !", player.id, player.name)
    }
    
    public func buildEnhanceGrid(Grid grid: [[Int?]], Columns nbColumns: Int, ShowColumn b: Bool = true) -> String {
        var str: String = gameName(Columns: nbColumns)
        str.append(addDecoration(Columns: nbColumns))
        for row in grid {
            str.append("│ ")
            for cell in row {
                str.append("\(String(describing: descriptionMapper[cell] ?? "  \u{007C} "))")
            }
            str.append("\n")
        }
        str.append(addDecoration(Columns: nbColumns))
        
        if b {
            str.append(addCases(Str: str, Columns: nbColumns))
        }
        return str;
    }
    
    public func buildGrid(Grille grid: String, Columns nbColumns: Int, ShowColumn b: Bool = true) -> String {
        var str: String = gameName(Columns: nbColumns)
        str.append(addDecoration(Columns: nbColumns))
        str += grid
        str.append(addDecoration(Columns: nbColumns))
        
        if b {
            str.append(addCases(Str: str, Columns: nbColumns))
        }
        return str
    }
    
    private func addCases(Str s: String, Columns nbColumns: Int) -> String {
        var str = s
        str.append("│")
        for k in 1 ... nbColumns {
            str.append(String(format: " %d │", k))
        }
        str.append("\n")
        str.append(addDecoration(Columns: nbColumns))
        return str
    }
}
