//
//  SafariWebExtensionHandler.swift
//  HomepageExtension
//
//  Created by Ahnaf Mahmud on 04/04/2024.
//

import SafariServices
import os.log

class SafariWebExtensionHandler: NSObject, NSExtensionRequestHandling {

    func beginRequest(with context: NSExtensionContext) {
        let request = context.inputItems.first as? NSExtensionItem
        let defaultPage = "options.html"

        let profile: UUID?
        if #available(iOS 17.0, macOS 14.0, *) {
            profile = request?.userInfo?[SFExtensionProfileKey] as? UUID
        } else {
            profile = request?.userInfo?["profile"] as? UUID
        }

        let message: String
        if #available(iOS 17.0, macOS 14.0, *) {
            let info = request?.userInfo?[SFExtensionMessageKey] as? AnyObject
            message = info?["message"] as? String ?? defaultPage
        } else {
            let info = request?.userInfo?["message"] as? AnyObject
            message = info?["message"] as? String ?? defaultPage
        }

        let describedMessage = String(describing: message)

        #if DEBUG
        os_log(
            .default,
            "Received message from browser.runtime.sendNativeMessage: %@ (profile: %@)",
            describedMessage,
            profile?.uuidString ?? "none"
        )
        #endif

        // Migrate homepage from older versions
        if UserDefaults.homepage == nil && describedMessage != defaultPage {
            UserDefaults.homepage = describedMessage
        }

        let response = NSExtensionItem()
        let url: String = UserDefaults.homepage ?? defaultPage
        response.userInfo = [ SFExtensionMessageKey: [ "url": url ] ]

        context.completeRequest(returningItems: [ response ], completionHandler: nil)
    }

}
