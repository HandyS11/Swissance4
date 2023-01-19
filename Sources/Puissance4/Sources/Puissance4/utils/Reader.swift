import Foundation

public struct Reader {
    
    public static func getInt() -> Int {
        do {
            //let choice = try Int(readLine(strippingNewline: true) ?? "42") ?? -1
            //return choice
            return 0
        }
        catch {
            print("You should enter an integer!\n")
            return getInt()
        }
    }
}
