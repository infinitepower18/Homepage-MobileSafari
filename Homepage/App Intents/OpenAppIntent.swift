//
//  OpenAppIntent.swift
//  Homepage
//
//  Created by Ahnaf Mahmud on 10/09/2024.
//

import AppIntents

/// An app intent to open the app
@available(iOS 16.0, *)
struct OpenAppIntent: AppIntent {

    static let title: LocalizedStringResource = "openApp"
    static let openAppWhenRun: Bool = true

    func perform() async throws -> some IntentResult {
        return .result()
    }
}
