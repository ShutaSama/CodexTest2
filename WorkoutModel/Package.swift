// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "WorkoutModel",
    products: [
        .library(name: "WorkoutModel", targets: ["WorkoutModel"])
    ],
    targets: [
        .target(
            name: "WorkoutModel",
            path: "Sources"
        ),
        .testTarget(
            name: "WorkoutModelTests",
            dependencies: ["WorkoutModel"],
            path: "Tests"
        )
    ]
)
