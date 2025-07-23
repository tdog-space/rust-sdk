// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "MobileSdkRs",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "MobileSdkRs",
            targets: ["MobileSdkRs"]
        )
    ],
    targets: [
        .binaryTarget(name: "RustFramework", url: "https://github.com/tdog-space/rust-sdk/releases/download/0.1.0/RustFramework.xcframework.zip", checksum: "32116dd9a96485563b67b64f48544c5e31f99c564dd9ba8e7774370ffaba2101"),
        .target(
            name: "MobileSdkRs",
            dependencies: [
                .target(name: "RustFramework")
            ],
            path: "rust/MobileSdkRs/Sources/MobileSdkRs",
            swiftSettings: [
                //.swiftLanguageMode(.v5)  // required until https://github.com/mozilla/uniffi-rs/issues/2448 is closed
            ]
        ),
        .target(
            path: "./ios/MobileSdk/Sources/MobileSdk",
            swiftSettings: [
                //.swiftLanguageMode(.v5)  // some of our code isn't concurrent-safe (e.g. OID4VCI.swift)
            ]
        ),
    ]
)
