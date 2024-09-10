//
//  SetHomepageButton.swift
//  Homepage
//
//  Created by Ahnaf Mahmud on 10/09/2024.
//

import SwiftUI
import WidgetKit

/// A button to open the Homepage app
struct SetHomepageButton: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.ip18.Homepage.SetHomepageButton"
        ) {
            ControlWidgetButton(action: OpenAppIntent()) {
                Label("setHomepage", image: "HouseGear")
            }
        }
        .displayName("setHomepage")
    }
}
