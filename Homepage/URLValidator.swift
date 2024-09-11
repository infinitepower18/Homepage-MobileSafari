//
//  URLValidator.swift
//  Homepage
//
//  Created by Ahnaf Mahmud on 11/06/2024.
//

import UIKit

class URLValidator {
    /// Check if the URL is valid
    /// - Parameter urlString: The URL to validate
    /// - Returns: Whether the URL is valid
    static func isValidURL(_ urlString: String) -> Bool {
        // Check if URL is "about:blank"
        if urlString == "about:blank" {
            return true
        }

        // swiftlint:disable line_length
        let urlRegex = #"^(https?:\/\/)(([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,}|((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9]))(:(6553[0-5]|655[0-2][0-9]|65[0-4][0-9]{2}|6[0-4][0-9]{3}|[1-5][0-9]{4}|[0-9]{1,4}))?(\/[^\s]*)?$"# // Regular expression for URL validation
        // swiftlint:enable line_length

        // Check if the URL matches the regex
        if urlString.range(of: urlRegex, options: .regularExpression) != nil {
            return true
        }

        return false
    }
}
