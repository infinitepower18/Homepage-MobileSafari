//
//  UserDefaults+Extension.swift
//  Homepage
//
//  Created by Ahnaf Mahmud on 11/06/2024.
//

import Foundation

extension UserDefaults {
    /// The app group to use for UserDefaults
    static let group = UserDefaults(suiteName: "group.com.ip18.Homepage")

    /// The user defined homepage URL
    static var homepage: String {
        get {
            UserDefaults.group?.string(forKey: "homepage") ?? ""
        }
        set {
            UserDefaults.group?.set(newValue, forKey: "homepage")
        }
    }
}
