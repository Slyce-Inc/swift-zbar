// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "ZBar",
    products: [ .library(name: "ZBar", targets: ["ZBar"]) ],
    dependencies: [],
    targets: [
        .target(name: "Clibzbar", dependencies: []),
        .target(name: "ZBar", dependencies: ["Clibzbar"]),
    ]
)
