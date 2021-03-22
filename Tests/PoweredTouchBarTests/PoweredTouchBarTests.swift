import XCTest
import SwiftUI
@testable import PoweredTouchBar

final class PoweredTouchBarTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        _ = Text("123")
            .poweredTouchBar {
                PoweredTouchBarButton(identifier: "HelloWorld", title: "Test button", action: {})
                PoweredTouchBarButton(identifier: "HelloWorld", title: "Test button", action: {})
            }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
