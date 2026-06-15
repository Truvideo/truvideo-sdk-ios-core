// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "TruvideoSdk",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "TruvideoSdk",
            targets: ["TruvideoSdk", "TruvideoSdkTarget"]
        ),
        .library(
            name: "TruvideoSdkCamera",
            targets: ["TruvideoSdkCamera", "TruvideoSdkCameraTarget"]
        ),
        .library(
            name: "TruvideoSdkMedia",
            targets: ["TruvideoSdkMedia", "TruvideoSdkMediaTarget"]
        ),
        .library(
            name: "TruvideoSdkImage",
            targets: ["TruvideoSdkImage", "TruvideoSdkImageTarget"]
        ),
        .library(
            name: "TruvideoSdkVideo",
            targets: ["TruvideoSdkVideo", "TruvideoSdkVideoTarget"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/aws-amplify/aws-sdk-ios-spm", exact: "2.33.4"),
        .package(url: "https://github.com/Truvideo/truvideo-sdk-ios-common", exact: "0.0.78"),
        .package(url: "https://github.com/Truvideo/truvideo-sdk-ios-video-utils", exact: "0.0.3")
    ],
    targets: Target.allTargets
)

extension Target {
    
    static var allTargets: [Target] {
        [
            truvideoSdkTargets,
            truVideoMediaProcessingTargets,
            truVideoMediaUploadTargets,
            truvideoSdkCameraTargets,
            truvideoSdkImageTargets,
            truvideoSdkMediaTargets,
            truvideoSdkVideoTargets,
        ]
            .flatMap(\.self)
    }
    
    static var truvideoSdkTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdk",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.4/TruvideoSdk.xcframework.zip",
            checksum: "dd32dc589cc4f8e51d2c5e3027470cc4fbc6b154ad9d013445990101cb8786a0"
        ),
        .target(
            name: "TruvideoSdkTarget",
            dependencies: [
                .product(name: "Common", package: "truvideo-sdk-ios-common"),
                .product(name: "AWSS3", package: "aws-sdk-ios-spm"),
                .product(name: "AWSCore", package: "aws-sdk-ios-spm")
            ],
            path: "TruVideoSdk"
        ),
    ]
    
    static var truvideoSdkCameraTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdkCamera",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.4/TruvideoSdkCamera.xcframework.zip",
            checksum: "cfa17086a805b4b40cc51fb923015321db39dcbf5cdc2a622c7c110080738ec8"
        ),
        .target(
            name: "TruvideoSdkCameraTarget",
            dependencies: [
                "TruvideoSdkTarget",
                "TruVideoMediaUploadTarget",
                .product(name: "TruvideoSdkVideoUtils", package: "truvideo-sdk-ios-video-utils")
            ],
            path: "TruVideoSdkCamera"
        ),
    ]

    static var truvideoSdkImageTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdkImage",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.4/TruvideoSdkImage.xcframework.zip",
            checksum: "a00b1c76ab996090a807c32b02ace99ad33b6b76a2aa863c3019cc87ba85faff"
        ),
        .target(
            name: "TruvideoSdkImageTarget",
            dependencies: [
                "TruvideoSdkTarget",
            ],
            path: "TruVideoSdkImage"
        ),
    ]
    
    static var truvideoSdkMediaTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdkMedia",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.4/TruvideoSdkMedia.xcframework.zip",
            checksum: "3d6abce5f01b45e674acb7fc4b8ec7065fc1dbfdd4d4107314af189396bae966"
        ),
        .target(
            name: "TruvideoSdkMediaTarget",
            dependencies: [
                "TruvideoSdkTarget",
                "TruVideoMediaUploadTarget"
            ],
            path: "TruVideoSdkMedia"
        ),
    ]
    
    static var truvideoSdkVideoTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdkVideo",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.4/TruvideoSdkVideo.xcframework.zip",
            checksum: "84a12bdd4141dc6f68a8ff10e3132c4aa2bc4881f9de608536bbd4908a47106a"
        ),
        .target(
            name: "TruvideoSdkVideoTarget",
            dependencies: [
                "TruvideoSdkTarget",
                "TruVideoMediaProcessingTarget",
                .product(name: "TruvideoSdkVideoUtils", package: "truvideo-sdk-ios-video-utils")
            ],
            path: "TruVideoSdkVideo"
        ),
    ]
    
    static var truVideoMediaProcessingTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoMediaProcessing",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.4/TruVideoMediaProcessing.xcframework.zip",
            checksum: "3b6f7339f65248dbc2a1ffcdcc0cce2b8d131f9e9269b8bdbcc2a154e44ff5d7"
        ),
        .target(
            name: "TruVideoMediaProcessingTarget",
            dependencies: [
                "TruVideoMediaProcessing",
                "TruvideoSdkTarget",
            ],
            path: "TruVideoMediaProcessing"
        ),
    ]

    static var truVideoMediaUploadTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoMediaUpload",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.4/TruVideoMediaUpload.xcframework.zip",
            checksum: "35f2f553190a7db36c8f13042d6a03f0ac3734dfef7a64e3923717874eb1416b"
        ),
        .target(
            name: "TruVideoMediaUploadTarget",
            dependencies: [
                "TruVideoMediaUpload",
                "TruvideoSdkTarget",
            ],
            path: "TruVideoMediaUpload"
        ),
    ]
}
