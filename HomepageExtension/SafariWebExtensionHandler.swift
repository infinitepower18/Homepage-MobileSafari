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

        let profile: UUID?
        if #available(iOS 17.0, macOS 14.0, *) {
            profile = request?.userInfo?[SFExtensionProfileKey] as? UUID
        } else {
            profile = request?.userInfo?["profile"] as? UUID
        }

        let message: Any?
        if #available(iOS 17.0, macOS 14.0, *) {
            message = request?.userInfo?[SFExtensionMessageKey]
        } else {
            message = request?.userInfo?["message"]
        }

        #if DEBUG
        os_log(
            .default,
            "Received message from browser.runtime.sendNativeMessage: %@ (profile: %@)",
            String(describing: message),
            profile?.uuidString ?? "none"
        )
        #endif

        // Migrate homepage from older versions
        if !String(describing: message).isEmpty {
            UserDefaults.group?.setValue(String(describing: message), forKey: "homepage")
        }

        let response = NSExtensionItem()
        let url: String = UserDefaults.group?.string(forKey: "homepage") ?? "options.html"
        response.userInfo = [ SFExtensionMessageKey: [ "url": url ] ]

        context.completeRequest(returningItems: [ response ], completionHandler: nil)
    }

}
