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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.5-RC.7/TruvideoSdk.xcframework.zip",
            checksum: "1509ff9884240e08e7c789929fe6e9e44dad5dc389e059fecb29d66581f7ed41"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.5-RC.7/TruvideoSdkCamera.xcframework.zip",
            checksum: "16cfacb282b863380c496bd5dc3f07f9271c3ac11d0273980f43ba11e3fc0491"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.5-RC.7/TruvideoSdkImage.xcframework.zip",
            checksum: "33b3d500d838c4df41eed2a85f56d218011e4246424c180a2e21f131f7ce5611"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.5-RC.7/TruvideoSdkMedia.xcframework.zip",
            checksum: "a50cdb6073fce0ff62f2ba95a9410e1bc5ced5cb0c37eda1565ac4de582923d3"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.5-RC.7/TruvideoSdkVideo.xcframework.zip",
            checksum: "7666ab78084d605c52956468cc38c5307563bf54261f15cbb3c8dfda22775625"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.5-RC.7/TruVideoMediaProcessing.xcframework.zip",
            checksum: "c328f2e93adfb5b4b563ce0bbcfce1c3154aeea4eafc68481fdadeb5d9fbd801"
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
            url: "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.5-RC.7/TruVideoMediaUpload.xcframework.zip",
            checksum: "210eb9dbe46d5184675f1a5f69855e834c19c64e6b4d69f7cb554dd3ec42a954"
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
