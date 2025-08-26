//
//  HomepageApp.swift
//  Homepage
//
//  Created by Ahnaf Mahmud on 04/04/2024.
//

import SwiftUI

@main
struct HomepageApp: App {

    @Environment(\.openURL) private var openURL

    init() {
        let isUiTest = ProcessInfo.processInfo.arguments.contains("ui-testing")
        if UserDefaults.clearUrl || isUiTest {
            UserDefaults.homepage = nil
            UserDefaults.clearUrl = false
        }
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = UIColor.accent
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .tint(.accent)
        }
        .commands {
            CommandGroup(replacing: .help) {
                Button {
                    if let url = Constants.supportURL {
                        openURL(url)
                    }
                } label: {
                    Label("support", systemImage: "questionmark.circle")
                }
            }
        }
    }
}
