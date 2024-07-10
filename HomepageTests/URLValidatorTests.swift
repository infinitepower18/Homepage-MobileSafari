//
//  URLValidatorTests.swift
//  HomepageTests
//
//  Created by Ahnaf Mahmud on 11/06/2024.
//

import Testing
@testable import Homepage

struct URLValidatorTests {
    @Test func aboutBlank() {
        #expect(URLValidator.isValidURL("about:blank"))
    }

    @Test func validHTTPURL() {
        #expect(URLValidator.isValidURL("http://example.com"))
        #expect(URLValidator.isValidURL("http://example.org"))
        #expect(URLValidator.isValidURL("http://sub.example.com"))
        #expect(URLValidator.isValidURL("http://example.com/path"))
    }

    @Test func validHTTPSURL() {
        #expect(URLValidator.isValidURL("https://example.com"))
        #expect(URLValidator.isValidURL("https://example.org"))
        #expect(URLValidator.isValidURL("https://sub.example.com"))
        #expect(URLValidator.isValidURL("https://example.com/path"))
    }

    @Test func validURLsWithPort() {
        #expect(URLValidator.isValidURL("http://example.com:80"))
        #expect(URLValidator.isValidURL("https://example.com:443"))
        #expect(URLValidator.isValidURL("http://sub.example.com:8080"))
        #expect(URLValidator.isValidURL("https://example.org:1234/path"))
    }

    @Test func invalidNoProtocolURL() {
        #expect(!URLValidator.isValidURL("example.com"))
        #expect(!URLValidator.isValidURL("sub.example.com"))
        #expect(!URLValidator.isValidURL("example.com/path"))
        #expect(!URLValidator.isValidURL("example.org/path?query=value"))
        #expect(!URLValidator.isValidURL("example.net#fragment"))
    }

    @Test func invalidURLs() {
        #expect(!URLValidator.isValidURL("ftp://example.com"))
        #expect(!URLValidator.isValidURL("http://example"))
        #expect(!URLValidator.isValidURL("example"))
        #expect(!URLValidator.isValidURL("https://example.c"))
        #expect(!URLValidator.isValidURL("https://"))
        #expect(!URLValidator.isValidURL("://example.com"))
        #expect(!URLValidator.isValidURL("http:/example.com"))
        #expect(!URLValidator.isValidURL("https:example.com"))
    }

    @Test func invalidURLsWithPort() {
        #expect(!URLValidator.isValidURL("http://example.com:"))
        #expect(!URLValidator.isValidURL("http://example.com:port"))
        #expect(!URLValidator.isValidURL("http://example.com:999999"))
        #expect(!URLValidator.isValidURL("http://example.com:-80"))
    }

    @Test func validURLsWithQueryAndFragment() {
        #expect(URLValidator.isValidURL("https://example.com/path?query=value"))
        #expect(URLValidator.isValidURL("https://example.com/path#fragment"))
        #expect(URLValidator.isValidURL("http://example.com/path?query=value#fragment"))
    }

    @Test func edgeCases() {
        #expect(!URLValidator.isValidURL(""))
        #expect(!URLValidator.isValidURL(" "))
        #expect(!URLValidator.isValidURL("http://.com"))
        #expect(!URLValidator.isValidURL("http://example."))
    }
}
