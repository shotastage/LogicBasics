// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LogicBasics",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LogicBasics",
            targets: ["LogicBasics"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LogicBasics"
        ),
        .testTarget(
            name: "LogicBasicsTests",
            dependencies: ["LogicBasics"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
