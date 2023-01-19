import Foundation

public class Displayer {
    
    public static func gameName(Columns columns: Int = 7) -> String {
        var str: String = "\n"
        
        for _ in 1 ... columns-3 {
            str.append("  ")
        }
        str.append("Swissance 4\n")
        return str
    }
}
