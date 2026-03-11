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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.7/TruvideoSdk.xcframework.zip",
            checksum: "16e662c59fe90e7382dbf9c81aa4548d72fbcc2a238f50264bff88ffcb61d178"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.7/TruvideoSdkCamera.xcframework.zip",
            checksum: "e2b90d3e711446d5d101b7634bb78c06b70adf0a4ec627528e4aff18c09be921"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.7/TruvideoSdkMedia.xcframework.zip",
            checksum: "b99270b6a3cd22f08bdf55adbc1e687a1faeeaaf6a6e7fbb184536279f989e68"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.7/TruvideoSdkVideo.xcframework.zip",
            checksum: "dc11ec8b4bec68350f64b21820a3b8fa2de8d9e6c6087612843edd5c7d9aad06"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.7/DI.xcframework.zip",
            checksum: "7f74b95a9ec42fe2b2b17d3d30a6cf43e54af099b38971a475d43412aaf2939f"
        )
    ]
    
    static var networkingTargets: [Target] = [
        .binaryTarget(
            name: "Networking",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.7/Networking.xcframework.zip",
            checksum: "462f59598b0790232b25823255c10b9e7b73f3e8adffd9aeaaaad85c6b41b9f1"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.7/StorageKit.xcframework.zip",
            checksum: "a244457902d6c833f6caa129c8a3900717f31921878a75c1389664b67cebe0fa"
        )
    ]
    
    static var truVideoApiTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoApi",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.7/TruVideoApi.xcframework.zip",
            checksum: "01d3e20d80530b1b68fc5e55fe37dcf49c9828a99e7cdb8d4b34e96e5ffc8ac5"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.7/TruVideoFoundation.xcframework.zip",
            checksum: "e1f94886aaedbc4e4bb3270db57e3bd2b1acbb00a37aca290e47c5b7befe56b6"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.7/TruVideoMediaUpload.xcframework.zip",
            checksum: "2ae0d05a582bf61f43399e6a1549ed14adba54e6ae4a59a02eb617e725300561"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.7/TruVideoRuntime.xcframework.zip",
            checksum: "b1d522da39d5f5b8a4d0e5fc7fddb1f54409229454e890d09d9459078de6eace"
        )
    ]
}
