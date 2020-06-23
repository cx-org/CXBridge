#if canImport(Combine)

import XCTest
import CXBridge
import CXShim

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
final class CombineIdentifierTests: XCTestCase {
    
    func testBridging() {
        _ = CXShim.CombineIdentifier().ac
        _ = CXShim.Subscriptions.empty.ac
        _ = CXShim.Subscribers.Completion<Error>.finished.ac
        _ = CXShim.Subscribers.Demand.max(1).ac
        // TODO: Conflict: Cancellable.ac and Subscriber.ac
        _ = CXShim.Subscribers.Sink<Int, Never>(receiveCompletion: { _ in }, receiveValue: { _ in })
        _ = CXShim.Just(1).ac
        _ = CXShim.PassthroughSubject<Int, Never>().ac
        _ = JSONEncoder().cx.ac
        _ = JSONDecoder().cx.ac
        
    }

    static var allTests = [
        ("testBridging", testBridging),
    ]
}

#endif
