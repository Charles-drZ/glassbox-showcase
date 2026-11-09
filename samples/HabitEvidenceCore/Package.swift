// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "HabitEvidenceCore",
    products: [
        .library(name: "HabitEvidenceCore", targets: ["HabitEvidenceCore"])
    ],
    targets: [
        .target(name: "HabitEvidenceCore"),
        .testTarget(name: "HabitEvidenceCoreTests", dependencies: ["HabitEvidenceCore"])
    ]
)
