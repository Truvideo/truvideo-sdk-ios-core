// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let commonPackageVersion = "0.0.1"
let packageVersion = "0.0.6"
let sharedPackageVersion = "0.0.3"

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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-common-wrapper/releases/download/\(commonPackageVersion)/Common.xcframework.zip",
            checksum: "0d4b5f63a41b265a9522f8957785bdb04c355a325cb38a9bff760281e96d7d38"
        ),
        .binaryTarget(
            name: "Shared",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-common/releases/download/\(sharedPackageVersion)/shared.xcframework.zip",
            checksum: "5028e25b25b24e6f35fbe4484dfc438a31345a9d5bf5666640e99849cfb497cb"
        ),
        .binaryTarget(
            name: "TruvideoSdk",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/\(packageVersion)/TruvideoSdk.xcframework.zip",
            checksum: "80fe73db1d5fb2f365f787cb6176937dd54d5afa3d7eba7ba7536f17a0a8e1c1"
        ),
        .target(
            name: "TruvideoSdkTargets",
            dependencies: [
                .target(name: "Common"),
                .target(name: "Shared"),
                .target(name: "TruvideoSdk")
            ],
            path: "Sources"
        )
    ]
)
