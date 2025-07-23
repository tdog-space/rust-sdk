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
        .binaryTarget(name: "RustFramework", url: "https://github.com/tdog-space/rust-sdk/releases/download/0.3.0/RustFramework.xcframework.zip", checksum: "50b8295e64955016673306057d00883d29e104bbc897587f2c556a706d05731a"),
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
