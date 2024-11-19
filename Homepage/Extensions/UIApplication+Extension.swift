//
//  UIApplication+Extension.swift
//  Homepage
//
//  Created by Ahnaf Mahmud on 19/11/2024.
//

import UIKit

extension UIApplication {
    /// The application version
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}
