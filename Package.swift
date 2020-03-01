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
    ],
    dependencies: [
        .package(url: "https://github.com/cx-org/CombineX", .upToNextMinor(from: "0.2.0")),
    ],
    targets: [
        .target(
            name: "CXBridge",
            dependencies: ["CombineX"]),
        .testTarget(
            name: "CXBridgeTests",
            dependencies: ["CXBridge"]),
    ]
)
