import Foundation

public extension Date {
    
    static let formatter = DateFormatter()
    
    init?(_ year: Int, _ month: Int, _ day: Int) {
        guard year >= 0 && month >= 1 && month <= 12 && day >= 1 && day <= 31 else {
            return nil
        }
        Date.formatter.dateFormat = "yyyy-MM-dd"
        if let temp = Date.formatter.date(from: String(format: "%d-%d-%d", year, month, day)) {
            self = temp
            return
        }
        return nil
    }
}
