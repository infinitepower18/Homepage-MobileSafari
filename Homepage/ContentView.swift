//
//  ContentView.swift
//  Homepage
//
//  Created by Ahnaf Mahmud on 04/04/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(uiImage: UIImage(named: "AppIcon")!)
                .resizable()
                .frame(width: 64, height: 64)
                .cornerRadius(10)
            Text("Homepage Safari Extension")
                .font(.title)
            Text("To set up, enable the extension and ensure it is set as the new tab page.\n\nTo set the homepage URL of your choice:\n\n1. Open your device's settings app\n\n2. Select the Safari app followed by Extensions\n\n3. Select the extension and tap Settings")
            Button {
                let url = URL(string: "https://github.com/infinitepower18/Homepage-MobileSafari")
                UIApplication.shared.open(url!)
            } label: {
                Text("View on GitHub")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
