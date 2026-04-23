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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.2/TruvideoSdk.xcframework.zip",
            checksum: "39fe7fa87ad2380a36f1028872cb7f04abcdcf69d3dc618f51e554a502578799"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.2/TruvideoSdkCamera.xcframework.zip",
            checksum: "160d7a1535d6266c3333b4c5be815c18197222e9b4e5aa90eb6f4fce8410f5a9"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.2/TruvideoSdkImage.xcframework.zip",
            checksum: "133aa9ee90d4bc52ba2a0d0caee44c56ca89702674ec42a10710ef80ce548c85"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.2/TruvideoSdkMedia.xcframework.zip",
            checksum: "7ca260a346295da19a1449663e53dac85755f9bb4287d3736f97cb1872c32bf6"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.2/TruvideoSdkVideo.xcframework.zip",
            checksum: "20b5cc8713e7aa56f83667fbe9e089d35236a7268f81b40a009f07fe8054a583"
        ),
        .target(
            name: "TruvideoSdkVideoTarget",
            dependencies: [
                "TruvideoSdkTarget",
                .product(name: "TruvideoSdkVideoUtils", package: "truvideo-sdk-ios-video-utils")
            ],
            path: "TruVideoSdkVideo"
        ),
    ]
    
    static var truVideoMediaUploadTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoMediaUpload",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.2/TruVideoMediaUpload.xcframework.zip",
            checksum: "839cffafad0c2ae9db94834600e671327fb10e272ccc270b56e8426c2da3d6e1"
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
