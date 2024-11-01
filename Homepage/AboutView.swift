//
//  AboutView.swift
//  Homepage
//
//  Created by Ahnaf Mahmud on 01/11/2024.
//

import SwiftUI
import AboutKit

struct AboutView: View {

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            AboutAppView(configuration: AboutConfiguration.configuration)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button {
                            dismiss()
                        } label: {
                            Text("done")
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AboutView()
}
