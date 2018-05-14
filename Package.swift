// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "libZBar",
    products: [ .library(name: "ZBar", targets: ["ZBar"]) ],
    dependencies: [],
    targets: [
        .target(name: "libzbar", dependencies: []),
        .target(name: "ZBar", dependencies: ["libzbar"]),
    ]
)
