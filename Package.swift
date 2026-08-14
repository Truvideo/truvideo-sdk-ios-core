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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.7-RC.8/TruvideoSdk.xcframework.zip",
            checksum: "a70b6800771ab0a2f5a31abb7dfc6b5a9aff91e457f8c8f43ea5e70d879f4388"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.7-RC.8/TruvideoSdkCamera.xcframework.zip",
            checksum: "0994a0f84523bf5f9bd6d75a63abc24ec335825066089fb825b512fef26228a8"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.7-RC.8/TruvideoSdkImage.xcframework.zip",
            checksum: "c1c554461b46e1ed992e63fe22252d6ec3570d7b0ff71b6edbe03b9ead094993"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.7-RC.8/TruvideoSdkMedia.xcframework.zip",
            checksum: "f2a80ce3a0267ff5996725b8d9954f8460149623e6f331415962e6841c4f3ce0"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.7-RC.8/TruvideoSdkVideo.xcframework.zip",
            checksum: "ce794f6aae4b8b39075592a044b23979a37ba290cecbbc8e60534a65b77c35a5"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.7-RC.8/TruVideoMediaProcessing.xcframework.zip",
            checksum: "aa611a506c6c8b37fcf3fbc7182ec77a703f6637fe8be29a57c4a8fda68a75f9"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.7-RC.8/TruVideoMediaUpload.xcframework.zip",
            checksum: "f05fa4fa75149865f4f16849ae17c7697c194a8489230d5f98b654ac3179e306"
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
