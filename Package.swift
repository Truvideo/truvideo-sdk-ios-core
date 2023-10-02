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
            name: "TruvideoSdk",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/0.0.26/TruvideoSdk.xcframework.zip",
            checksum: "9c168032818e0c47a52cb6b12c3fc5a6e3974704a5227e21ef9ce1543b2ae83c"
        ),
        .binaryTarget(
            name: "Shared",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/0.0.26/shared.xcframework.zip",
            checksum: "4445be410f9722f25088b0ff1b43af28788a19a286ab18b51e856ac25d92b6a6"
        ),
        .target(
            name: "TruvideoSdkTargets",
            dependencies: [
                .target(name: "TruvideoSdk")
                .target(name: "Shared")
            ],
            path: "Sources"
        )
    ]
)
