//
//  Bundle+Extension.swift
//  Homepage
//
//  Created by Ahnaf Mahmud on 15/06/2024.
//

import Foundation

extension Bundle {
    /// Get the icon file name
    static var iconFileName: String? {
        guard
            let icons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any],
            let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
            let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
            let iconFileName = iconFiles.last
        else {
            #if DEBUG
            print("Could not find icons in bundle")
            #endif
            return nil
        }
        return iconFileName
    }
}
