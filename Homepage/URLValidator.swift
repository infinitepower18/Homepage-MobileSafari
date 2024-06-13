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

        // Regular expression for URL validation
        let urlRegex = #"^(https?:\/\/)(([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,})(\/[^\s]*)?$"#

        // Check if the URL matches the regex
        if urlString.range(of: urlRegex, options: .regularExpression) != nil {
            return true
        }

        return false
    }
}
