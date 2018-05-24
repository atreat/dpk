// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DevPoop",
    products: [
        .executable(
            name: "devp",
            targets: ["DevPoop"]),
        .library(
            name: "DevPoopKit",
            targets: ["DevPoopKit"]),
        .library(
            name: "AlamofireSynchronous",
            targets: ["AlamofireSynchronous"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/Commander.git", from: "0.8.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.0.0")
    ],
    targets: [
        .target(
            name: "AlamofireSynchronous",
            dependencies: [
                "Alamofire",
            ]),
        .target(
            name: "DevPoop",
            dependencies: [
                "Alamofire",
                "AlamofireSynchronous",
                "Commander",
                "DevPoopKit"
            ]),
        .target(
            name: "DevPoopKit",
            dependencies: [
                "Alamofire",
                "Commander",
            ]),
        .testTarget(
            name: "DevPoopTests",
            dependencies: ["DevPoop"]),
    ]
)
