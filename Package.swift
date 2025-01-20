// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "xxooooxxiOSLibrary",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "xxooooxxCommonUI",
            targets: ["xxooooxxCommonUI"]
        )
    ],
    targets: [
        .target(name: "xxooooxxCommonUI")
    ]
)
