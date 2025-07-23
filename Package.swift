// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "SpruceIDMobileSdk",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SpruceIDMobileSdk",
            targets: ["SpruceIDMobileSdk"]
        ),
        .library(
            name: "SpruceIDMobileSdkRs",
            targets: ["SpruceIDMobileSdkRs"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.2.0")
    ],
    targets: [
        .binaryTarget(name: "RustFramework", url: "https://github.com/thanhtan541/rust-sdk/releases/download/0.1.0/RustFramework.xcframework.zip", checksum: "9376e914a68d1d5f65cca92f1fc813c534f73e45938115c47cfc343857698357"),
        .target(
            name: "SpruceIDMobileSdkRs",
            dependencies: [
                .target(name: "RustFramework")
            ],
            path: "rust/MobileSdkRs/Sources/MobileSdkRs",
            swiftSettings: [
                //.swiftLanguageMode(.v5)  // required until https://github.com/mozilla/uniffi-rs/issues/2448 is closed
            ]
        ),
        .target(
            name: "SpruceIDMobileSdk",
            dependencies: [
                .target(name: "SpruceIDMobileSdkRs"),
                .product(name: "Algorithms", package: "swift-algorithms"),
            ],
            path: "./ios/MobileSdk/Sources/MobileSdk",
            swiftSettings: [
                //.swiftLanguageMode(.v5)  // some of our code isn't concurrent-safe (e.g. OID4VCI.swift)
            ]
        ),
        .testTarget(
            name: "SpruceIDMobileSdkTests",
            dependencies: ["SpruceIDMobileSdk"],
            path: "./ios/MobileSdk/Tests/MobileSdkTests"
        ),
    ]
)
