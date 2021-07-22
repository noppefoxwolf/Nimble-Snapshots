// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Nimble-Snapshots",
    platforms: [.iOS(.v10)],
    products: [
        .library(
            name: "NimbleSnapshots",
            targets: ["NimbleSnapshotsObjC"]),
    ],
    dependencies: [
        .package(
            name: "Nimble",
            url: "https://github.com/Quick/Nimble",
            from: "9.0.0"
        ),
        .package(
            name: "FBSnapshotTestCase",
            url: "https://github.com/bfernandesbfs/ios-snapshot-test-case",
            .branch("feature/spm")
        )
    ],
    targets: [
        .target(
            name: "NimbleSnapshots",
            dependencies: [
                "Nimble",
                "FBSnapshotTestCase",
            ],
            path: "Nimble_Snapshots",
            exclude: [
                "DynamicType",
                "DynamicSize",
                "XCTestObservationCenter+CurrentTestCaseTracker.h",
                "XCTestObservationCenter+CurrentTestCaseTracker.m",
                "Info.plist",
                "Nimble_Snapshots.xcconfig",
            ],
            sources: [
                "CurrentTestCaseTracker.swift",
                "HaveValidSnapshot.swift",
                "PrettySyntax.swift",
                "SwiftPMSupport.swift",
            ]),
        .target(
            name: "NimbleSnapshotsObjC",
            dependencies: [
                "Nimble",
                "FBSnapshotTestCase",
                "NimbleSnapshots"
            ],
            path: "Nimble_Snapshots",
            exclude: [
                "CurrentTestCaseTracker.swift",
                "HaveValidSnapshot.swift",
                "PrettySyntax.swift",
                "DynamicType",
                "DynamicSize",
                "Info.plist",
                "Nimble_Snapshots.xcconfig",
                "SwiftPMSupport.swift",
            ],
            sources: [
                "XCTestObservationCenter+CurrentTestCaseTracker.h",
                "XCTestObservationCenter+CurrentTestCaseTracker.m",
            ]
        ),
//        .target(
//            name: "DynamicType",
//            dependencies: [
//                "NimbleSnapshots",
//                "DynamicTypeObjC",
//            ],
//            path: "Nimble_Snapshots/DynamicType",
//            sources: [
//                ".",
//            ]),
//        .target(
//            name: "DynamicTypeObjC",
//            dependencies: [
//                "NimbleSnapshots",
//            ],
//            path: "Nimble_Snapshots/DynamicType",
//            sources: [
//                "NBSMockedApplication.h",
//                "NBSMockedApplication.m",
//            ]),
//        .testTarget(
//            name: "Nimble-SnapshotsTests",
//            dependencies: ["Nimble-Snapshots"]),
    ]
)
