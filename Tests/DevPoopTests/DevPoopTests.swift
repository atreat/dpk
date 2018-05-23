import XCTest
@testable import DevPoop

final class DevPoopTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DevPoop().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
