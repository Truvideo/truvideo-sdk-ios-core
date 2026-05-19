// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "TruvideoSdk",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "TruvideoSdk",
            targets: [
                "TruvideoSdk"
            ]
        ),
        .library(
            name: "TruvideoSdkCamera",
            targets: [
                "TruvideoSdkCamera",
                "TruvideoSdk",
                "TruVideoMediaUpload"
            ]
        ),
        .library(
            name: "TruvideoSdkMedia",
            targets: [
                "TruvideoSdkMedia",
                "TruvideoSdk",
                "TruVideoMediaUpload"
            ]
        ),
        .library(
            name: "TruvideoSdkImage",
            targets: [
                "TruvideoSdkImage",
                "TruvideoSdk",
                "TruVideoMediaUpload"
            ]
        ),
        .library(
            name: "TruvideoSdkVideo",
            targets: [
                "TruvideoSdkVideo",
                "TruvideoSdk"
            ]
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
            truVideoMediaUploadTargets,
            truvideoSdkCameraTargets,
            truvideoSdkImageTargets,
            truvideoSdkMediaTargets,
            truvideoSdkVideoTargets,
            internalTargets
        ]
            .flatMap(\.self)
    }
    
    static var truvideoSdkTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdk",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.1/TruvideoSdk.xcframework.zip",
            checksum: "ccb2e4f776e33ea5f929440920e2746afbeb773eae61c1d051b6a0a1ba20c630"
        ),
    ]
    
    static var truvideoSdkCameraTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdkCamera",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.1/TruvideoSdkCamera.xcframework.zip",
            checksum: "1c3500d0c78355e348c9f166eb7c67b21f0e6ea8c76dfade162193c9a7627e1d"
        ),
    ]

    static var truvideoSdkImageTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdkImage",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.1/TruvideoSdkImage.xcframework.zip",
            checksum: "e30a40cc76799013b16482718368de19813e4707f94adcaba779ddbd4d9abd34"
        ),
    ]
    
    static var truvideoSdkMediaTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdkMedia",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.1/TruvideoSdkMedia.xcframework.zip",
            checksum: "957bfa6376e915663735d80dc44e319d379340699145657929dc2b744bda95e4"
        ),
    ]
    
    static var truvideoSdkVideoTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdkVideo",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.1/TruvideoSdkVideo.xcframework.zip",
            checksum: "52cc8c5f867484c9485a21023312fba297c6f37628109f2d820fddf229cc9f72"
        ),
    ]
    
    static var truVideoMediaUploadTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoMediaUpload",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.1/TruVideoMediaUpload.xcframework.zip",
            checksum: "41b189e299cd6a0bd6302d16104c2ac89a521f464c21abc33a09f6f1607446f3"
        ),
    ]
    
    static var internalTargets: [Target] = [
        .target(
            name: "_TruvideoSdkDependencies",
            dependencies: [
                "TruvideoSdk",
                .product(name: "Common", package: "truvideo-sdk-ios-common"),
                .product(name: "AWSS3", package: "aws-sdk-ios-spm"),
                .product(name: "AWSCore", package: "aws-sdk-ios-spm")
            ],
            path: "TruVideoSdk"
        ),
        .target(
            name: "_TruvideoSdkCameraDependencies",
            dependencies: [
                "TruvideoSdkCamera",
                "TruvideoSdk",
                "TruVideoMediaUpload",
                .product(name: "TruvideoSdkVideoUtils", package: "truvideo-sdk-ios-video-utils")
            ],
            path: "TruVideoSdkCamera"
        ),
        .target(
            name: "_TruvideoSdkImageDependencies",
            dependencies: [
                "TruvideoSdkImage",
                "TruvideoSdk",
                "TruVideoMediaUpload"
            ],
            path: "TruVideoSdkImage"
        ),
        .target(
            name: "_TruvideoSdkMediaDependencies",
            dependencies: [
                "TruvideoSdkMedia",
                "TruvideoSdk",
                "TruVideoMediaUpload"
            ],
            path: "TruVideoSdkMedia"
        ),
        .target(
            name: "_TruvideoSdkVideoDependencies",
            dependencies: [
                "TruvideoSdkVideo",
                "TruvideoSdk",
                .product(name: "TruvideoSdkVideoUtils", package: "truvideo-sdk-ios-video-utils")
            ],
            path: "TruVideoSdkVideo"
        ),
        .target(
            name: "_TruVideoMediaUploadDependencies",
            dependencies: [
                "TruVideoMediaUpload",
                "TruvideoSdk"
            ],
            path: "TruVideoMediaUpload"
        ),
    ]
}
