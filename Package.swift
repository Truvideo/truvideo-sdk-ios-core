// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TruVideoCore",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)        
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TruVideoCore",
            targets: ["TruVideoCore"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.1"),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess", from: "4.2.2"),
        .package(url: "https://github.com/Truvideo/truvideo-sdk-ios-common.git", from: "0.0.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TruVideoCore",
            dependencies: [
                "Alamofire",
                .product(name: "Common", package: "truvideo-sdk-ios-common"),
                "KeychainAccess"
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "TruVideoCoreTests",
            dependencies: ["TruVideoCore"],
            path: "Tests",
            resources: [
                .process("Test Resources")
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
