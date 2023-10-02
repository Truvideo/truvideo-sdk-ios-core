// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TruvideoSdk",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TruvideoSdk",
            targets: ["TruvideoSdkTargets"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
         .binaryTarget(
            name: shared,
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/0.0.19/shared.xcframework.zip",
            checksum: "4445be410f9722f25088b0ff1b43af28788a19a286ab18b51e856ac25d92b6a6"
        ),
        .binaryTarget(
            name: "TruvideoSdk",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/0.0.19/TruvideoSdk.xcframework.zip",
            checksum: "71f75a02736c679e0bb9da7b66abb7f8754966e9d7ddc543004c2c4f7cdf6a48"
        ),
        .target(
            name: "TruvideoSdkTargets",
            dependencies: [
                .target(name: "shared")
                .target(name: "TruvideoSdk")
            ],
            path: "Sources"
        )
    ]
)
