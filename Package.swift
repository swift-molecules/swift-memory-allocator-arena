// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-memory-allocator-arena",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Memory Allocator Arena",
            targets: ["Memory Allocator Arena"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-atoms/swift-memory.git", branch: "main"),
        .package(
            url: "https://github.com/swift-molecules/swift-memory-allocation.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Memory Allocator Arena",
            dependencies: [
                .product(name: "Memory", package: "swift-memory"),
                .product(
                    name: "Memory Standard Library Integration",
                    package: "swift-memory"
                ),
                .product(name: "Memory Allocator", package: "swift-memory-allocation"),
                .product(
                    name: "Memory Allocator Protocol",
                    package: "swift-memory-allocation"
                ),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem
}
