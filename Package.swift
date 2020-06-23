// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "CXBridge",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v8),
        .tvOS(.v9),
        .watchOS(.v2),
    ],
    products: [
        .library(
            name: "CXBridge",
            targets: ["CXBridge"]),
        .executable(
            name: "CXBridgeExample",
            targets: ["CXBridgeExample"]),
    ],
    dependencies: [
        .package(url: "https://github.com/cx-org/CombineX", .upToNextMinor(from: "0.2.0")),
    ],
    targets: [
        .target(
            name: "CXBridge",
            dependencies: ["CXShim"]),
        .target(
            name: "CXBridgeExample",
            dependencies: ["CXBridge"]),
        .testTarget(
            name: "CXBridgeTests",
            dependencies: ["CXBridge"]),
    ]
)

// MARK: -

enum CombineImplementation {
    
    case combine
    case combineX
    case openCombine
    
    static var `default`: CombineImplementation {
        #if canImport(Combine)
        return .combine
        #else
        return .combineX
        #endif
    }
    
    init?(_ description: String) {
        let desc = description.lowercased().filter { $0.isLetter }
        switch desc {
        case "combine":     self = .combine
        case "combinex":    self = .combineX
        case "opencombine": self = .openCombine
        default:            return nil
        }
    }
    
    var swiftSettings: [SwiftSetting] {
        switch self {
        case .combine:      return [.define("USE_COMBINE")]
        case .combineX:     return [.define("USE_COMBINEX")]
        case .openCombine:  return [.define("USE_OPEN_COMBINE")]
        }
    }
}

extension ProcessInfo {
    
    var combineImplementation: CombineImplementation {
        return environment["CX_COMBINE_IMPLEMENTATION"].flatMap(CombineImplementation.init) ?? .default
    }
}

import Foundation

var combineImp = ProcessInfo.processInfo.combineImplementation

for target in package.targets {
    target.swiftSettings = combineImp.swiftSettings
}

if combineImp == .combine {
    package.platforms = [.macOS("10.15"), .iOS("13.0"), .tvOS("13.0"), .watchOS("6.0")]
}
