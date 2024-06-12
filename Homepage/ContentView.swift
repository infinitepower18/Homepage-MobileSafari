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
        NavigationView {
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    VStack(spacing: 20) {
                        subViews
                    }
                    .padding()
                    .onAppear {
                        urlInput = UserDefaults.homepage ?? ""
                    }
                    .alert(isPresented: $showSuccessAlert) {
                        Alert(
                            title: Text("homepageSaved"),
                            message: Text("homepageSavedDescription"),
                            dismissButton: .default(Text("ok"))
                        )
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                if let url = URL(string: "https://github.com/infinitepower18/Homepage-MobileSafari") {
                                    UIApplication.shared.open(url)
                                }
                            } label: {
                                Text("viewRepo")
                            }
                        }
                    }
                    .frame(width: geometry.size.width)
                    .frame(minHeight: geometry.size.height)
                }
            }
        }
        .navigationViewStyle(.stack)
    }

    private var subViews: some View {
        Group {
            if let icon = UIImage(named: "AppIcon") {
                Image(uiImage: icon)
                    .resizable()
                    .frame(width: 64, height: 64)
                    .cornerRadius(10)
            }
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
                UserDefaults.homepage = urlInput
                if UserDefaults.homepage == urlInput {
                    showSuccessAlert = true
                }
            } label: {
                Text("save")
                    .font(.title)
            }
            .disabled(!URLValidator.isValidURL(urlInput))
            Text("setupHelp")
        }
    }
}

#Preview {
    ContentView()
}
