//
//  BundleExtensionTests.swift
//  HomepageTests
//
//  Created by Ahnaf Mahmud on 15/06/2024.
//

import Testing
import Foundation

@testable import Homepage

struct BundleExtensionTests {
    @Test func canGetIconFileName() async throws {
        #expect(Bundle.iconFileName != nil)
    }
}
