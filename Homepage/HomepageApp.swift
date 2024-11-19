//
//  HomepageApp.swift
//  Homepage
//
//  Created by Ahnaf Mahmud on 04/04/2024.
//

import SwiftUI

@main
struct HomepageApp: App {

    init() {
        if UserDefaults.clearUrl {
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
    }
}
