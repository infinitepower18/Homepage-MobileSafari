//
//  Backport.swift
//  Homepage
//
//  Created by Ahnaf Mahmud on 16/10/2024.
//

import SwiftUI

struct Backport<Content> {
    let content: Content
}

extension View {
    var backport: Backport<Self> { Backport(content: self) }
}

extension Backport where Content: View {
    @ViewBuilder func bounceBasedOnSize() -> some View {
        if #available(iOS 16.4, *) {
            content.scrollBounceBehavior(.basedOnSize)
        } else {
            content
        }
    }

    @MainActor
    @ViewBuilder func disableWritingTools() -> some View {
        if #available(iOS 18, *) {
            content.writingToolsBehavior(.disabled)
        } else {
            content
        }
    }
}
