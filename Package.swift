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
        ]
            .flatMap(\.self)
    }
    
    static var truvideoSdkTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdk",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.27/TruvideoSdk.xcframework.zip",
            checksum: "036ccdf1950b7a801d249f92f5adf50f38ddbc967297976a4886f2aad28f166d"
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
            path: "TruvideoSdk"
        ),
    ]
    
    static var truvideoSdkCameraTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdkCamera",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.27/TruvideoSdkCamera.xcframework.zip",
            checksum: "51b6556a364048f79212bdfe529aa485b29bda60710e35a466e4b99832052666"
        ),
        .target(
            name: "TruvideoSdkCameraTarget",
            dependencies: [
                "TruvideoSdkTarget",
                "TruVideoMediaUploadTarget",
                .product(name: "TruvideoSdkVideoUtils", package: "truvideo-sdk-ios-video-utils")
            ],
            path: "TruvideoSdkCamera"
        ),
    ]
    
    static var truvideoSdkMediaTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdkMedia",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.27/TruvideoSdkMedia.xcframework.zip",
            checksum: "882e4259897ebb7eeada576fd9d18484d19830be09ab78e1c0ca91dfeb7fd8c1"
        ),
        .target(
            name: "TruvideoSdkMediaTarget",
            dependencies: [
                "TruvideoSdkTarget",
                "TruVideoMediaUploadTarget"
            ],
            path: "TruvideoSdkMedia"
        ),
    ]
    
    static var diTargets: [Target] = [
        .binaryTarget(
            name: "DI",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.27/DI.xcframework.zip",
            checksum: "1828c307ec4ee568f7ccc7cbb84cdb29dfaa1722c0e1b6bd97bb86cecb61bfe6"
        )
    ]
    
    static var networkingTargets: [Target] = [
        .binaryTarget(
            name: "Networking",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.27/Networking.xcframework.zip",
            checksum: "5b7ecf0c96c53af61d4164e596cfe25e5264a6b18eed065e5a82f0594b3b6431"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.27/StorageKit.xcframework.zip",
            checksum: "8b166d1371122eddde8fec90a33bbeb578934905a11101c5c48786b16670ebc8"
        )
    ]
    
    static var truVideoApiTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoApi",
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.27/TruVideoApi.xcframework.zip",
            checksum: "71231acad9304a3387811c0e009c868fc19bf0e1b94641b0c64d1d77d7937164"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.27/TruVideoFoundation.xcframework.zip",
            checksum: "ee93e31a73bd133f01baaa6ead977a827c4af7d9c61a657e31df0f82075f4b00"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.27/TruVideoMediaUpload.xcframework.zip",
            checksum: "73f469ec8ff956f4f1e24cae1fefccfd27cff7fcc2aa781e063a8fb8b2bcac85"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/78.2.3-RC.27/TruVideoRuntime.xcframework.zip",
            checksum: "4cbccebaf3eb988361d30f91e58e7e16af26e79c9a7993ecb1145dfdb7770ccf"
        )
    ]
}
