//
//  ContentView.swift
//  Homepage
//
//  Created by Ahnaf Mahmud on 04/04/2024.
//

import SwiftUI

struct ContentView: View {

    @State private var urlInput = ""
    @State private var showSuccessAlert = false

    var body: some View {
        VStack(spacing: 20) {
            Image(uiImage: UIImage(named: "AppIcon")!)
                .resizable()
                .frame(width: 64, height: 64)
                .cornerRadius(10)
            Text("title")
                .font(.title)
            TextField(
                "url",
                text: $urlInput
            )
            .keyboardType(.URL)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .textFieldStyle(.roundedBorder)
            Button {
                UserDefaults.group?.set(urlInput, forKey: "homepage")
                showSuccessAlert = true
            } label: {
                Text("save")
                    .font(.title)
            }
            .disabled(!URLValidator.isValidURL(urlInput))
            Button {
                let url = URL(string: "https://github.com/infinitepower18/Homepage-MobileSafari")
                UIApplication.shared.open(url!)
            } label: {
                Text("viewRepo")
            }
        }
        .padding()
        .onAppear {
            urlInput = UserDefaults.group?.string(forKey: "homepage") ?? ""
        }
        .alert(isPresented: $showSuccessAlert) {
            Alert(
                title: Text("homepageSaved"),
                message: Text("setupHelp"), 
                dismissButton: .default(Text("ok"))
            )
        }
    }
}

#Preview {
    ContentView()
}
