import Foundation

public struct Displayer {
    
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
    
    public func buildGrid(Grille grid: String, Columns nbColumns: Int, ShowColumn b: Bool = true) -> String {
        var str: String = addDecoration(Columns: nbColumns)
        str += grid
        
        if b {
            str.append("│")
            for k in 1 ... nbColumns {
                str.append(String(format: " %d │", k))
            }
            str.append("\n")
            str.append(addDecoration(Columns: nbColumns))
        }
        return str
    }
}
