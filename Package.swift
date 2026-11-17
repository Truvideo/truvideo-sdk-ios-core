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
        .package(url: "https://github.com/5Exceptions-Mobile-Team/NCKit", exact: "1.2.1"),
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.2.1/TruvideoSdk.xcframework.zip",
            checksum: "d251cc6b48cb206261a7b03eb845a116cea93b85f04fdc5fa459b6782a6d02c1"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.2.1/TruvideoSdkCamera.xcframework.zip",
            checksum: "ce193262406f2c7fe765528c80ae50ebcaa83723149073a49e3e886c53b8021a"
        ),
        .target(
            name: "TruvideoSdkCameraTarget",
            dependencies: [
                "TruvideoSdkTarget",
                "TruVideoMediaProcessingTarget",
                "TruVideoMediaUploadTarget",                
            ],
            path: "TruVideoSdkCamera"
        ),
    ]

    static var truvideoSdkImageTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdkImage",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.2.1/TruvideoSdkImage.xcframework.zip",
            checksum: "43317c245acc02b1073ddaab27b4d6ea8b9ebcda8a14d62178f8739a5858d11c"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.2.1/TruvideoSdkMedia.xcframework.zip",
            checksum: "e5e59c167d72b14b47e6afbbd54a5f8c040e47860410b58a6b6ea7d92a42a6e5"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.2.1/TruvideoSdkVideo.xcframework.zip",
            checksum: "596ddfc445006c22350c0643b887c15dbc8ceb687b30aea05972a01e70a0f4fe"
        ),
        .target(
            name: "TruvideoSdkVideoTarget",
            dependencies: [
                "TruvideoSdkTarget",
                "TruVideoMediaProcessingTarget",
            ],
            path: "TruVideoSdkVideo"
        ),
    ]
    
    static var truVideoMediaProcessingTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoMediaProcessing",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.2.1/TruVideoMediaProcessing.xcframework.zip",
            checksum: "dcb147133cca8894b5bd7851c7910b7dd369d62b548ce469f352ca65fb5e15fd"
        ),
        .target(
            name: "TruVideoMediaProcessingTarget",
            dependencies: [
                "TruVideoMediaProcessing",
                "TruvideoSdkTarget",
                .product(name: "NCKit", package: "NCKit"),
                .product(name: "TruvideoSdkVideoUtils", package: "truvideo-sdk-ios-video-utils"),
            ],
            path: "TruVideoMediaProcessing"
        ),
    ]

    static var truVideoMediaUploadTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoMediaUpload",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.2.1/TruVideoMediaUpload.xcframework.zip",
            checksum: "14cef782fab3f073625ccb3825afecaae0797ea3667d0b127f21c2d9b98675bc"
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
