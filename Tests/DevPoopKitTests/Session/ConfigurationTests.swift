import XCTest
@testable import DevPoopKit

final class ConfigurationTests: XCTestCase {
    func testAssignment() {
        var c = Configuration(
            platform   : .ios,
            apiVersion : "ABC",
            teamId     : "123"
        )

        assert(c.platform == .ios)
        assert(c.apiVersion == "ABC")
        assert(c.teamId == "123")

        c.teamId = "456"
        assert(c.teamId == "456")
    }
}
