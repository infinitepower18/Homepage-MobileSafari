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
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = UIColor.accent
    }

    var body: some Scene {
        WindowGroup {
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    ContentView()
                        .frame(width: geometry.size.width)
                        .frame(minHeight: geometry.size.height)
                        .tint(.accent)
                }
            }
        }
    }
}
