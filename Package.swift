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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.6/TruvideoSdk.xcframework.zip",
            checksum: "072ea49ec4fcbea422e5579aa8a8c3bde82fd74ce4a51014b9faca0e2777f3f1"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.6/TruvideoSdkCamera.xcframework.zip",
            checksum: "bea0eb5895699583eb48e1ec96e6700cb9f08b7946b604e1bac7f7c6e00ee481"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.6/TruvideoSdkMedia.xcframework.zip",
            checksum: "7fb9f0b9cf3e51cb415c85613b6d0986cf6c464b1d40a148833629da2669ff0f"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.6/TruvideoSdkVideo.xcframework.zip",
            checksum: "78a520b6d94db0f5b8cc601b2d608cd07d85ef7378b8773f6c3d5a06a1ac2e32"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.6/DI.xcframework.zip",
            checksum: "1253c6794272e3f0bd6957ce75904bc8a979e42864d8b6acc566f5b6c603e9ed"
        )
    ]
    
    static var networkingTargets: [Target] = [
        .binaryTarget(
            name: "Networking",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.6/Networking.xcframework.zip",
            checksum: "0b5fa0c6d0ff72b4c6af6f6e6a0acf057142289b8142fbc69fcd0ade1e4fb208"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.6/StorageKit.xcframework.zip",
            checksum: "ccb2c671e1ba29326a43b2984fa5c4ed06b14747d2bd6ec42d556b9fc713690c"
        )
    ]
    
    static var truVideoApiTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoApi",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.6/TruVideoApi.xcframework.zip",
            checksum: "6e65c13de83fd15fa1b53fee0fbd71966ac8a7eb8b516910ff2931cc94e83ab0"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.6/TruVideoFoundation.xcframework.zip",
            checksum: "146a26fe1e5d2fdb1d995e56e8c7a5ae01bf40f613b8e53928ab3dd7668816db"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.6/TruVideoMediaUpload.xcframework.zip",
            checksum: "4cc5979882e2860c4093586636e8af483dc361278330066ffbee3885f5ce2324"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/79.0.0-RC.6/TruVideoRuntime.xcframework.zip",
            checksum: "d1e8c5adee733b1c0a68acdabd41c08dc6d308340fd6dc2ccd0e4ad53f3f8405"
        )
    ]
}
