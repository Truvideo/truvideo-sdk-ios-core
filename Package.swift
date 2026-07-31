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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.7-EU.1/TruvideoSdk.xcframework.zip",
            checksum: "334cd5f4d808c0ebbee0b36e265f543bbbef2ab08a23123080536bde99f3594d"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.7-EU.1/TruvideoSdkCamera.xcframework.zip",
            checksum: "c661461efcec781aead304a34b1a2a035ae0d65f24f36aad588d254ccc481344"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.7-EU.1/TruvideoSdkImage.xcframework.zip",
            checksum: "3b6e695e9bbdb7a11b9fe6013b0eb8677b8f4cae2c1ac0f0d218ff8ab20d0ab9"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.7-EU.1/TruvideoSdkMedia.xcframework.zip",
            checksum: "41acfc9b97d3f2fd73c4bd6b15b3c23eee92f3974f334d833ad2e6e73e3c8c59"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.7-EU.1/TruvideoSdkVideo.xcframework.zip",
            checksum: "588611c4c2e62f76cb00aa7c5254ac206f91ff13ad1f4426e6feca6d17d4071e"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.7-EU.1/TruVideoMediaProcessing.xcframework.zip",
            checksum: "6738c410a73e60b5009d3e73c74c8ac06704cf40ab9e1d40d80d6e3503156a74"
        ),
        .target(
            name: "TruVideoMediaProcessingTarget",
            dependencies: [
                "TruVideoMediaProcessing",
                "TruvideoSdkTarget",
                .product(name: "NCKit", package: "NCKit"),
            ],
            path: "TruVideoMediaProcessing"
        ),
    ]

    static var truVideoMediaUploadTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoMediaUpload",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.7-EU.1/TruVideoMediaUpload.xcframework.zip",
            checksum: "1f7aad79a53083658cb735abf9f550f76ca55eae1949326556b4bd6818717ae6"
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
