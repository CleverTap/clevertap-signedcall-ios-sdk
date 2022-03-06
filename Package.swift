// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "DirectCallSDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "DirectCallSDK",
            targets: ["DirectCall"]
        )
    ],
    targets: [
        .target(
            name: "DirectCall",
            dependencies: ["SocketIO", "DirectCallSDK"]
        ),
        .binaryTarget(
            name: "DirectCallSDK",
            url: "https://github.com/CleverTap/clevertap-directcall-ios-sdk/releases/download/0.0.1/DirectCallSDK.xcframework.zip",
            checksum: "9e8b6e5df5812544d76b3398be0df4eabfbb5ea2d6abfefb8e50a85d06e0d3e4"
        )
    ],
    dependencies: [
        .package(url: "https://github.com/socketio/socket.io-client-swift.git", from: "15.2.0")
    ]
)
