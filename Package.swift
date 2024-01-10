// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "TruvideoSdk",
    products: [
        .library(
            name: "TruvideoSdk",
            targets: ["TruvideoSdkTargets"]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "TruvideoSdk",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/0.1.00/TruvideoSdk.xcframework.zip",
            checksum: "058dc6bada9dc85e1e307bcacc62af86ca3e0c8658e77af8947f5d550800fe91"
        ),
        .binaryTarget(
            name: "Common",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-common/releases/download/0.0.26/Common.xcframework.zip",
            checksum: "43fcac1b0801d7c3f06ba256be78b133f3317e16d96bbd84ec0b110b59448c76"
        ),
        .binaryTarget(
            name: "Shared",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-shared/releases/download/0.0.32/shared.xcframework.zip",
            checksum: "00d34a4f0cd0c1a2ebbd4ef465beb983331660e6e4d03b43ae1a843e8cce37d7"
        ),
        .target(
            name: "TruvideoSdkTargets",
            dependencies: [
                .target(name: "TruvideoSdk"),
                .target(name: "Common"),
                .target(name: "Shared")
            ],
            path: "Sources"
        )
    ]
)
