//
//  HomepageUITests.swift
//  HomepageUITests
//
//  Created by Ahnaf Mahmud on 01/02/2025.
//

import XCTest

final class HomepageUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testViewComponents() throws {
        let app = XCUIApplication()
        app.launchArguments += ["ui-testing"]
        app.launch()

        let icon = app.images["Homepage icon"]
        XCTAssertTrue(icon.exists)

        let title = app.staticTexts["Title"]
        XCTAssertTrue(title.exists)

        let input = app.textFields["URL input"]
        XCTAssertTrue(input.exists)

        let saveButton = app.buttons["Save button"]
        XCTAssertTrue(saveButton.exists)

        let helpText = app.staticTexts["Help text"]
        XCTAssertTrue(helpText.exists)

        let aboutButton = app.buttons["About button"]
        XCTAssertTrue(aboutButton.exists)
    }

    @MainActor
    func testSavingURL() throws {
        let app = XCUIApplication()
        app.launchArguments += ["ui-testing"]
        app.launch()

        let input = app.textFields["URL input"]
        input.tap()
        input.typeText("https://google.com")

        let button = app.buttons["Save button"]
        button.tap()

        let alert = app.alerts["Homepage Saved"]
        XCTAssertTrue(alert.exists)
    }

    @MainActor
    func testSavingInvalidURL() throws {
        let app = XCUIApplication()
        app.launchArguments += ["ui-testing"]
        app.launch()

        let input = app.textFields["URL input"]
        input.tap()
        input.typeText("google")

        let button = app.buttons["Save button"]
        button.tap()

        let alert = app.alerts["Invalid URL"]
        XCTAssertTrue(alert.exists)
    }

    @MainActor
    func testSavingURLWithoutHttpPrefix() throws {
        let app = XCUIApplication()
        app.launchArguments += ["ui-testing"]
        app.launch()

        let input = app.textFields["URL input"]
        input.tap()
        input.typeText("google.com")

        let button = app.buttons["Save button"]
        button.tap()

        let alert = app.alerts["Homepage Saved"]
        XCTAssertTrue(alert.exists)
    }

    @MainActor
    func testAboutAlert() throws {
        let app = XCUIApplication()
        app.launchArguments += ["ui-testing"]
        app.launch()

        let aboutButton = app.buttons["About button"]
        aboutButton.tap()

        let alert = app.alerts["Homepage for Safari"]
        XCTAssertTrue(alert.exists)

        let closeButton = alert.buttons["Close"]
        XCTAssertTrue(closeButton.exists)

        let supportButton = alert.buttons["Support"]
        XCTAssertTrue(supportButton.exists)
    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
