//
//  UserDefaults+Extension.swift
//  Homepage
//
//  Created by Ahnaf Mahmud on 11/06/2024.
//

import Foundation

extension UserDefaults {
    /// The app group to use for UserDefaults
    nonisolated(unsafe) static let group = UserDefaults(suiteName: "group.com.ip18.Homepage")

    /// The user defined homepage URL
    static var homepage: String? {
        get {
            UserDefaults.group?.string(forKey: "homepage")
        }
        set {
            UserDefaults.group?.set(newValue, forKey: "homepage")
        }
    }

    /// Whether the URL should be cleared
    static var clearUrl: Bool {
        get {
            UserDefaults.standard.bool(forKey: "clear_url")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "clear_url")
        }
    }
}
