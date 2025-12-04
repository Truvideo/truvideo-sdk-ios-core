// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "TruvideoSdk",
    products: [
        .library(
            name: "TruvideoSdk",
            targets: ["TruvideoSdkTargets"]),
    ],
    dependencies: [
        .package(url: "https://github.com/aws-amplify/aws-sdk-ios-spm", exact: "2.33.4")
    ],
    targets: [
        .binaryTarget(
            name: "TruvideoSdk",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.1-BETA.1/TruvideoSdk.xcframework.zip",
            checksum: "2004f0aa3a5c59ca6e7fe4c8fce78412f7a66638a86737ab9583feefb0b40ca7"
        ),
        .binaryTarget(
            name: "Common",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-common/releases/download/0.0.78/shared.xcframework.zip",
            checksum: "c7ce5c52624b54d49ebbf12f11e587390c62ab637e7bc02417e7ade8156fda86"
        ),
        .target(
            name: "TruvideoSdkTargets",
            dependencies: [
                .target(name: "TruvideoSdk"),
                .target(name: "Common"),
                .product(name: "AWSS3", package: "aws-sdk-ios-spm"),
                .product(name: "AWSCore", package: "aws-sdk-ios-spm"),
                .product(name: "AWSCognitoIdentityProvider", package: "aws-sdk-ios-spm"),
                .product(name: "AWSCognitoIdentityProviderASF", package: "aws-sdk-ios-spm")
            ],
            path: "Sources"
        )
    ]
)
