//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2021/07/22.
//

import Foundation
import FBSnapshotTestCase
import Nimble

extension String {
    init(_ staticString: StaticString) {
        self = staticString.withUTF8Buffer {
            String(decoding: $0, as: UTF8.self)
        }
    }
}

func _getDefaultReferenceDirectory(_ sourceFileName: FileString) -> String {
    #if SWIFT_PACKAGE
    getDefaultReferenceDirectory(String(sourceFileName))
    #else
    getDefaultReferenceDirectory(sourceFileName)
    #endif
}

extension FBSnapshotTest {
    class func _compareSnapshot(_ instance: Snapshotable,
                               isDeviceAgnostic: Bool = false,
                               usesDrawRect: Bool = false,
                               snapshot: String,
                               record: Bool,
                               referenceDirectory: String,
                               tolerance: CGFloat,
                               perPixelTolerance: CGFloat,
                               filename: FileString,
                               identifier: String? = nil,
                               shouldIgnoreScale: Bool = false) -> Bool {
        #if SWIFT_PACKAGE
        let filename = String(filename)
        #endif
        return compareSnapshot(instance, isDeviceAgnostic: isDeviceAgnostic, usesDrawRect: usesDrawRect, snapshot: snapshot, record: record, referenceDirectory: referenceDirectory, tolerance: tolerance, perPixelTolerance: perPixelTolerance, filename: filename, identifier: identifier, shouldIgnoreScale: shouldIgnoreScale)
    }
}
