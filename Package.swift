// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LogicBasics",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .library(
            name: "LogicBasics",
            targets: ["LogicBasics"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/shotastage/DataLogic.swift.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "CoreLibs"
        ),
        .target(
            name: "Engine"
        ),
        .target(
            name: "Functions",
            dependencies: [
                "Engine",
                .product(name: "DataLogic", package: "datalogic.swift"),
            ]
        ),
        .target(
            name: "LogicBasics",
            dependencies: ["CoreLibs", "Engine", "Functions"]
        ),
        .testTarget(
            name: "LogicBasicsTests",
            dependencies: ["LogicBasics"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
