import Foundation

public struct Reader : Scanner {
    
    public func getInt() -> Int {
        print("Please choose a column : ")
        let choice = Int(readLine()!)
        while(choice != nil) {
            print("You should enter an integer!\n")
            return getInt()
        }
        return choice!;
    }
}
