//
//  SetHomepageIntent.swift
//  Homepage
//
//  Created by Ahnaf Mahmud on 29/08/2024.
//

import AppIntents

/// An app intent to set a new homepage URL
@available(iOS 16.0, *)
struct SetHomepageIntent: AppIntent {

    static let title: LocalizedStringResource = "setHomepage"
    static let description: LocalizedStringResource = "setNewHomepage"

    @Parameter(title: "url")
    var homepageURL: String

    func perform() async throws -> some IntentResult & ProvidesDialog {
        if URLValidator.isValidURL(homepageURL) {
            UserDefaults.homepage = homepageURL
            return .result(dialog: IntentDialog("homepageSaved"))
        } else {
            return .result(dialog: IntentDialog("validationError"))
        }
    }
}
