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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/75.1.1-RC.135/TruvideoSdk.xcframework.zip",
            checksum: "ebf4af09262b919064f857a7c8ac490e08ab9ecf9424dcc4eb64d95f98bf7805"
        ),
        .binaryTarget(
            name: "Common",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-common/releases/download/0.0.75/shared.xcframework.zip",
            checksum: "7aee69571862f3e552832eaa12914da693563bca84f537eb83173f8b64958457"
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
