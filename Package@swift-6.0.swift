// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "swift-navigation",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    .library(
      name: "SwiftNavigation",
      targets: ["SwiftNavigation"]
    ),
    .library(
      name: "SwiftUINavigation",
      targets: ["SwiftUINavigation"]
    ),
    .library(
      name: "UIKitNavigation",
      targets: ["UIKitNavigation"]
    ),
    .library(
      name: "AppKitNavigation",
      targets: ["AppKitNavigation"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-collections", from: "1.0.0"),
    .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.0.0"),
    .package(url: "https://github.com/johankool/swift-case-paths", branch: "android-support"),
    .package(url: "https://github.com/johankool/swift-concurrency-extras", branch: "android-tests"),
    .package(url: "https://github.com/johankool/swift-custom-dump", branch: "android-support"),
    .package(url: "https://github.com/johankool/swift-perception", branch: "android-support"),
    .package(url: "https://github.com/johankool/swift-issue-reporting", branch: "android-support"),
  ],
  targets: [
    .target(
      name: "SwiftNavigation",
      dependencies: [
        .product(name: "CasePaths", package: "swift-case-paths"),
        .product(name: "CustomDump", package: "swift-custom-dump"),
        .product(name: "ConcurrencyExtras", package: "swift-concurrency-extras"),
        .product(name: "OrderedCollections", package: "swift-collections"),
        .product(name: "Perception", package: "swift-perception"),
      ]
    ),
    .testTarget(
      name: "SwiftNavigationTests",
      dependencies: [
        "SwiftNavigation"
      ]
    ),
    .target(
      name: "SwiftUINavigation",
      dependencies: [
        "UIKitNavigation",
        .product(name: "CasePaths", package: "swift-case-paths"),
        .product(name: "IssueReporting", package: "swift-issue-reporting"),
      ]
    ),
    .testTarget(
      name: "SwiftUINavigationTests",
      dependencies: [
        "SwiftUINavigation"
      ]
    ),
    .target(
      name: "UIKitNavigation",
      dependencies: [
        "SwiftNavigation",
        "UIKitNavigationShim",
        .product(name: "ConcurrencyExtras", package: "swift-concurrency-extras"),
      ]
    ),
    .target(
      name: "UIKitNavigationShim"
    ),
    .target(
      name: "AppKitNavigation",
      dependencies: [
        "SwiftNavigation",
      ]
    ),
    .testTarget(
      name: "UIKitNavigationTests",
      dependencies: [
        "UIKitNavigation"
      ]
    ),
  ],
  swiftLanguageModes: [.v6]
)

