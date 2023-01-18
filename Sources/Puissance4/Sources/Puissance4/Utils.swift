import Foundation

public class Utils {
    
    public static func gameName(Columns columns: Int = 7) -> String {
        var str: String = "\n"
        
        for _ in 1 ... columns-3 {
            str += "  "
        }
        str += "Swissance 4\n"
        
        return str
    }
}
