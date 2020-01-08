#if canImport(Combine)

import XCTest
import Combine
import CombineX
import CXBridge

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
final class CombineIdentifierTests: XCTestCase {
    
    func testBridging() {
        _ = Combine.CombineIdentifier().cx
        _ = CombineX.CombineIdentifier().ac
    }

    static var allTests = [
        ("testBridging", testBridging),
    ]
}

#endif
