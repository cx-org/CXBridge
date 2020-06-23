import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    #if anImport(Combine)
    return [
        testCase(CombineIdentifierTests.allTests),
    ]
    #else
    return []
    #endif
}
#endif
