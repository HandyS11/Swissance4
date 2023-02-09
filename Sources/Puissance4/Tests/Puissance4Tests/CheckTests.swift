import XCTest
@testable import Puissance4

final class CheckVictoryTests: XCTestCase {
    
    func testBoardCheckVictory() throws {
        func expect(PiecesToAlign nb: Int, Tab tab: [Int?], Result result: Status) {
            let check = CheckVictory()
            XCTAssertEqual(check.ckeckVictory(Entry: tab, PiecesToAlign: nb), result)
        }
        expect(PiecesToAlign: 4, Tab: [nil, nil, nil, nil, nil, nil, nil], Result: Status.CONTINUE)
        expect(PiecesToAlign: 4, Tab: [1, 2, 1, 2, 2, 2, 1], Result: Status.CONTINUE)
        expect(PiecesToAlign: 4, Tab: [1, 1, 1, nil, 1, nil, nil], Result: Status.CONTINUE)
        expect(PiecesToAlign: 4, Tab: [1, 1, 1, 1, 2, nil, nil], Result: Status.ENDED(REASON.PLAYER_ID(1)))
        expect(PiecesToAlign: 4, Tab: [nil, 2, 2, 2, 2, nil, nil], Result: Status.ENDED(REASON.PLAYER_ID(2)))
        expect(PiecesToAlign: 4, Tab: [nil, 2, 1, 2, 2, 2, 2], Result: Status.ENDED(REASON.PLAYER_ID(2)))
        expect(PiecesToAlign: 4, Tab: [1, 1, 1, 2, 1, 2, 2], Result: Status.CONTINUE)
        
        expect(PiecesToAlign: 5, Tab: [nil, 2, 2, 2, 2, 2, nil], Result: Status.ENDED(REASON.PLAYER_ID(2)))
        expect(PiecesToAlign: 5, Tab: [1, 1, 1, 2, 2, 2, 2], Result: Status.CONTINUE)
    }
}
