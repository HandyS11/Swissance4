import Foundation

public struct Decorator {
    
    public static func gameName(Columns columns: Int = 7) -> String {
        var str: String = "\n"
        
        for _ in 1 ... columns-3 {
            str.append("  ")
        }
        str.append("Swissance 4\n")
        return str
    }
    
    public static func addDecoration(Columns columns: Int) -> String {
        var s: String = String()
        for _ in 1 ... columns {
            s.append("\u{2015}\u{2015}\u{2015}\u{2015}")
        }
        s.append("\u{2015}\n")
        return s
    }
}
