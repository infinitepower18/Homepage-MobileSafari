//
//  AboutConfiguration.swift
//  Homepage
//
//  Created by Ahnaf Mahmud on 01/11/2024.
//

import AboutKit
import UIKit

class AboutConfiguration {

    static let configuration = AKConfiguration(
        app: app,
        otherApps: [],
        showShareApp: .always,
        showWriteReview: .always
    )

    static private let app = AKMyApp(
        id: "6481118559",
        name: String(localized: "appName"),
        appIcon: UIImage(named: "AppImage"),
        developer: developer,
        email: "mail@ahnafmahmud.com",
        websiteURL: URL(string: "https://github.com/infinitepower18/Homepage-MobileSafari")!,
        profiles: [],
        privacyPolicyURL: URL(string: "https://ahnafmahmud.com/apps/Homepage/PrivacyPolicy.html")!,
        termsOfUseURL: nil
    )

    static private let developer = AKDeveloper(
        id: "1632853916",
        name: "Ahnaf Mahmud",
        profiles: []
    )
}
