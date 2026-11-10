// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CivilDayCore",
    products: [
        .library(name: "CivilDayCore", targets: ["CivilDayCore"])
    ],
    targets: [
        .target(name: "CivilDayCore"),
        .testTarget(name: "CivilDayCoreTests", dependencies: ["CivilDayCore"])
    ]
)
