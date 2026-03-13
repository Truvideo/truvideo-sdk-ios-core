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
            diTargets,
            networkingTargets,
            storageKitTargets,
            truVideoRuntimeTargets,
            truVideoFoundationTargets,
            truVideoApiTargets,
            truvideoSdkTargets,
            truVideoMediaUploadTargets,
            truvideoSdkCameraTargets,
            truvideoSdkMediaTargets,
            truvideoSdkVideoTargets,
        ]
            .flatMap(\.self)
    }
    
    static var truvideoSdkTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdk",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.12/TruvideoSdk.xcframework.zip",
            checksum: "b83c0f8beda25579be20521a4c1aab1e5d16636f4d4722c1aa3e6d5e5e4560fc"
        ),
        .target(
            name: "TruvideoSdkTarget",
            dependencies: [
                "DI",
                "TruvideoSdk",
                "TruVideoApiTarget",
                "TruVideoRuntime",
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.12/TruvideoSdkCamera.xcframework.zip",
            checksum: "ace72b334b5066ba73282675004179c2236731051a5b3f10ea0749a2d2007637"
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
    
    static var truvideoSdkMediaTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdkMedia",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.12/TruvideoSdkMedia.xcframework.zip",
            checksum: "00cb0a1fb144b007c3e5601ef945957d6807c0b6eb682a85f10a542ffb82bbc6"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.12/TruvideoSdkVideo.xcframework.zip",
            checksum: "1a256708faf4100dadab572b050b444e4d756f5d8a4a5f26a3914493b2bea848"
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
    
    static var diTargets: [Target] = [
        .binaryTarget(
            name: "DI",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.12/DI.xcframework.zip",
            checksum: "b0bc518dfc7cd7dfeabc6752d01062c789e9f4f3e6043d72dd0406b5328ce33f"
        )
    ]
    
    static var networkingTargets: [Target] = [
        .binaryTarget(
            name: "Networking",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.12/Networking.xcframework.zip",
            checksum: "43d90a78e9aaaf3f7b002f41e6d1d37a33ada51e50d0bda513b95b53933cc143"
        ),
        .target(
            name: "NetworkingTarget",
            dependencies: [
                "DI",
                "Networking"
            ],
            path: "Networking"
        ),
    ]
    
    static var storageKitTargets: [Target] = [
        .binaryTarget(
            name: "StorageKit",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.12/StorageKit.xcframework.zip",
            checksum: "8af0b5c21e4b06b8d1ea285ee6e79fba1d0aaddd236b6373ebaa40c94403319e"
        )
    ]
    
    static var truVideoApiTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoApi",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.12/TruVideoApi.xcframework.zip",
            checksum: "7826f5bdea5da5c314fb45052d8f483f71bfd5170fb834148dffafafb555b731"
        ),
        .target(
            name: "TruVideoApiTarget",
            dependencies: [
                "DI",
                "NetworkingTarget",
                "StorageKit",
                "TruVideoApi",
                "TruVideoFoundationTarget",
            ],
            path: "TruVideoApi"
        ),
    ]
    
    static var truVideoFoundationTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoFoundation",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.12/TruVideoFoundation.xcframework.zip",
            checksum: "7fdb273f427c5023f0001b7a21fb17843fabdd238ee401deade85f7a07dfc862"
        ),
        .target(
            name: "TruVideoFoundationTarget",
            dependencies: [
                "TruVideoFoundation",
            ],
            path: "TruVideoFoundation"
        ),
    ]
    
    static var truVideoMediaUploadTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoMediaUpload",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.12/TruVideoMediaUpload.xcframework.zip",
            checksum: "3af71afad9c94787e0be165cfea03e64c96e65d0098b0aa199ad2d70e50b9426"
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
    
    static var truVideoRuntimeTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoRuntime",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.12/TruVideoRuntime.xcframework.zip",
            checksum: "4a72b9713d7e12b8814c8ea18f5108a13e422271d0a26e22ab6b6a8c7e9e050c"
        )
    ]
}
