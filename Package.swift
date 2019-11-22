// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "ZBar",
  products: [ 
    .library(name: "ZBar", targets: ["ZBar"]) 
  ],
  targets: [
    .target(name: "ZBar", dependencies: ["Clibzbar"]),
    .systemLibrary(
      name: "Clibzbar", 
      pkgConfig: "zbar", 
      providers: [
        .apt(["libzbar-dev"])
      ]),    
  ]
)
