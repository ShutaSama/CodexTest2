// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WorkoutTracker",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .executable(name: "WorkoutTracker", targets: ["WorkoutTracker"])
    ],
    dependencies: [
        .package(path: "../WorkoutModel")
    ],
    targets: [
        .executableTarget(
            name: "WorkoutTracker",
            dependencies: [
                "WorkoutModel"
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "WorkoutTrackerTests",
            dependencies: ["WorkoutTracker"],
            path: "Tests/WorkoutTrackerTests"
        )
    ]
)
