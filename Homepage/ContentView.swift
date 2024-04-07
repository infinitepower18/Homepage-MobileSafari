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
            Text("title")
                .font(.title)
            Text("helpText")
            Button {
                let url = URL(string: "https://github.com/infinitepower18/Homepage-MobileSafari")
                UIApplication.shared.open(url!)
            } label: {
                Text("viewRepo")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
