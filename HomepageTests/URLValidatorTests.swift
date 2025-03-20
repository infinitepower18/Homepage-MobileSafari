//
//  URLValidatorTests.swift
//  HomepageTests
//
//  Created by Ahnaf Mahmud on 11/06/2024.
//

import Testing
@testable import Homepage

struct URLValidatorTests {
    @Test func isCompleteURL() {
        #expect(URLValidator.isCompleteURL("http://example.com"))
        #expect(URLValidator.isCompleteURL("https://example.com"))
    }

    @Test func isIncompleteURL() {
        #expect(!URLValidator.isCompleteURL("example.com"))
    }

    @Test func aboutBlank() {
        #expect(URLValidator.isCompleteURL("about:blank"))
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

    @Test func validIPAddresses() {
        #expect(URLValidator.isValidURL("http://127.0.0.1"))
        #expect(URLValidator.isValidURL("http://192.168.1.1"))
        #expect(URLValidator.isValidURL("https://255.255.255.255"))
    }

    @Test func validIPAddressesWithPort() {
        #expect(URLValidator.isValidURL("http://127.0.0.1:80"))
        #expect(URLValidator.isValidURL("https://192.168.1.1:443"))
        #expect(URLValidator.isValidURL("http://10.0.0.1:8080"))
        #expect(URLValidator.isValidURL("https://8.8.8.8:53/path"))
    }

    @Test func invalidIPAddresses() {
        #expect(!URLValidator.isValidURL("http://999.999.999.999"))
        #expect(!URLValidator.isValidURL("http://256.256.256.256"))
        #expect(!URLValidator.isValidURL("https://123.456.789.000"))
        #expect(!URLValidator.isValidURL("http://192.168.1"))
        #expect(!URLValidator.isValidURL("http://192.168.1.999"))
    }

    @Test func invalidIPAddressesWithPort() {
        #expect(!URLValidator.isValidURL("http://127.0.0.1:999999"))
        #expect(!URLValidator.isValidURL("http://192.168.1.1:-1"))
        #expect(!URLValidator.isValidURL("https://10.0.0.1:abcd"))
        #expect(!URLValidator.isValidURL("http://8.8.8.8:"))
    }

    @Test func validIPAddressesWithQueryAndFragment() {
        #expect(URLValidator.isValidURL("http://192.168.1.1/path"))
        #expect(URLValidator.isValidURL("http://10.0.0.1/path#fragment"))
    }

    @Test func validDataURL() {
        #expect(URLValidator.isValidURL("data:,Hello%2C%20World%21"))
    }
}
