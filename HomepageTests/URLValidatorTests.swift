//
//  URLValidatorTests.swift
//  HomepageTests
//
//  Created by Ahnaf Mahmud on 11/06/2024.
//

import XCTest
@testable import Homepage

class URLValidatorTests: XCTestCase {
    func testAboutBlank() {
        XCTAssertTrue(URLValidator.isValidURL("about:blank"))
    }

    func testValidHTTPURL() {
        XCTAssertTrue(URLValidator.isValidURL("http://example.com"))
        XCTAssertTrue(URLValidator.isValidURL("http://example.org"))
        XCTAssertTrue(URLValidator.isValidURL("http://sub.example.com"))
        XCTAssertTrue(URLValidator.isValidURL("http://example.com/path"))
    }

    func testValidHTTPSURL() {
        XCTAssertTrue(URLValidator.isValidURL("https://example.com"))
        XCTAssertTrue(URLValidator.isValidURL("https://example.org"))
        XCTAssertTrue(URLValidator.isValidURL("https://sub.example.com"))
        XCTAssertTrue(URLValidator.isValidURL("https://example.com/path"))
    }

    func testInvalidURLs() {
        XCTAssertFalse(URLValidator.isValidURL("ftp://example.com"))
        XCTAssertFalse(URLValidator.isValidURL("http://example"))
        XCTAssertFalse(URLValidator.isValidURL("https://example.c"))
        XCTAssertFalse(URLValidator.isValidURL("https://"))
        XCTAssertFalse(URLValidator.isValidURL("://example.com"))
        XCTAssertFalse(URLValidator.isValidURL("http:/example.com"))
        XCTAssertFalse(URLValidator.isValidURL("https:example.com"))
    }

    func testValidURLsWithQueryAndFragment() {
        XCTAssertTrue(URLValidator.isValidURL("https://example.com/path?query=value"))
        XCTAssertTrue(URLValidator.isValidURL("https://example.com/path#fragment"))
        XCTAssertTrue(URLValidator.isValidURL("http://example.com/path?query=value#fragment"))
    }

    func testEdgeCases() {
        XCTAssertFalse(URLValidator.isValidURL(""))
        XCTAssertFalse(URLValidator.isValidURL(" "))
        XCTAssertFalse(URLValidator.isValidURL("http://.com"))
        XCTAssertFalse(URLValidator.isValidURL("http://example."))
    }
}
