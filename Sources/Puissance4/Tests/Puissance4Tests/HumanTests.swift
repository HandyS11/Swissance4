import XCTest
@testable import Puissance4

final class HumanTests: XCTestCase {
    
    func testsHumanDefault() throws {
        let human1 = Human(Id: 1, Name: "name", Scanner: Reader())
        let human2 = Human(Id: 1, Name: "name", Carac: "#", Scanner: Reader())
        
        XCTAssertNotNil(human1)
        XCTAssertNotNil(human2)
    }
}
