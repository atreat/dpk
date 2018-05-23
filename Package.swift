// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DevPoop",
    products: [
        .library(
            name: "DevPoop",
            targets: ["DevPoop"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jakeheis/SwiftCLI", from: "5.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.0.0")
    ],
    targets: [
        .target(
            name: "DevPoop",
            dependencies: []),
        .testTarget(
            name: "DevPoopTests",
            dependencies: ["DevPoop"]),
    ]
)
