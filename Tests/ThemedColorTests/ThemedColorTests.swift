import XCTest
@testable import ThemedColor

final class ThemedColorTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ThemedColor().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
