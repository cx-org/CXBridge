import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    #if canImport(Combine)
    return [
        testCase(CombineIdentifierTests.allTests),
    ]
    #else
    return []
    #endif
}
#endif
