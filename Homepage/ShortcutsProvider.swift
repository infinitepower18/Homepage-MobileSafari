//
//  ShortcutsProvider.swift
//  Homepage
//
//  Created by Ahnaf Mahmud on 29/08/2024.
//

import AppIntents

@available(iOS 16.0, *)
struct ShortcutsProvider: AppShortcutsProvider {

    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: SetHomepageIntent(),
            phrases: [
                "Set a new URL in \(.applicationName)"
            ],
            shortTitle: "setHomepage",
            systemImageName: "house.fill"
        )
    }

    static let shortcutTileColor: ShortcutTileColor = .purple
}
