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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.30/TruvideoSdk.xcframework.zip",
            checksum: "b6e641c6f88f0d9dd5873532e067891ee6ea2e07fc5d9968c9a00a36f93e8acc"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.30/TruvideoSdkCamera.xcframework.zip",
            checksum: "dd168b4f8f78ce0549e65ad573761fa35e5046c5b1eeec31d381b9f6008a4a4f"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.30/TruvideoSdkMedia.xcframework.zip",
            checksum: "752828ee386a1151f6449824649afafbe2cc5d088b870270511a63f374f3348e"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.30/TruvideoSdkVideo.xcframework.zip",
            checksum: "91178c5437f3929cd980cf298d44ac825c8e073bedd3763d80206ee8aef1d178"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.30/DI.xcframework.zip",
            checksum: "f9c639aebadc84caa5fdf2e4c029ceb052d76560ef797bd03390717147f3e269"
        )
    ]
    
    static var networkingTargets: [Target] = [
        .binaryTarget(
            name: "Networking",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.30/Networking.xcframework.zip",
            checksum: "ce040533ac44292b8743a22ef82d84f1d7348b01632862b08220e02de40b79ca"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.30/StorageKit.xcframework.zip",
            checksum: "f2b47011d3217b5ee7192e657aff25516d9dd304d1ea2710f3c840c8155d9735"
        )
    ]
    
    static var truVideoApiTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoApi",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.30/TruVideoApi.xcframework.zip",
            checksum: "f083501eae530fb4b1e9d4de86524cc893f2beb8ed11745134ba0c1b5060907d"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.30/TruVideoFoundation.xcframework.zip",
            checksum: "0b5ae1756366c93cbdb14cec697ab3d87cf2249b8cf8a353f8e2610e9bd70a9b"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.30/TruVideoMediaUpload.xcframework.zip",
            checksum: "4afe4ba872e2f98191353a2b652e24438a699a4962ea30fabce4a79118f41730"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.30/TruVideoRuntime.xcframework.zip",
            checksum: "8956e816601658ec3bc801beb7e3757fa28877e6de6d45ccd22652ba08d4adfc"
        )
    ]
}
