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
        ),
        .library(
            name: "xxooooxxCommonFunction",
            targets: ["xxooooxxCommonFunction"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/google/GoogleSignIn-iOS", from: "8.0.0")
    ],
    targets: [
        .target(
            name: "xxooooxxCommonUI",
            dependencies: [
                .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS")
            ]
        ),
        .testTarget(
            name: "xxooooxxCommonUITest",
            dependencies: ["xxooooxxCommonUI"]
        ),
        .target(name: "xxooooxxCommonFunction")
    ]
)
