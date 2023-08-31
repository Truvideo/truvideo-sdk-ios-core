// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let commonPackageVersion = "0.0.4"
let packageVersion = "0.0.5"

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
            name: "Common",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-common/releases/download/\(commonPackageVersion)/Common.xcframework.zip",
            checksum: "4e029bf878f4d9a6eecd9a9ac695de840b204f0bba0181681fc583161e69a362"
        ),
        .binaryTarget(
            name: "TruvideoSdk",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/\(packageVersion)/TruvideoSdk.xcframework.zip",
            checksum: "13ba616fc8fb88b04b8d5770ca6e6ce54d08d0f7d3899c5379fb57e156ab4fab"
        ),
        .target(
            name: "TruvideoSdkTargets",
            dependencies: [
                .target(name: "Common"),
                .target(name: "TruvideoSdk")
            ],
            path: "Sources"
        )
    ]
)
