//
//  ContentView.swift
//  Homepage
//
//  Created by Ahnaf Mahmud on 04/04/2024.
//

import SwiftUI

struct ContentView: View {

    @State private var urlInput = ""
    @State private var showAlert = false
    @State private var alertType: AlertType = .failed

    private let githubURL = "https://github.com/infinitepower18/Homepage-MobileSafari"

    @MainActor private var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    if isPhone {
                        stack
                            .frame(width: geometry.size.width)
                            .frame(minHeight: geometry.size.height)
                    } else {
                        HStack {
                            Spacer()
                            stack
                                .frame(width: geometry.size.width / 2)
                                .frame(minHeight: geometry.size.height)
                            Spacer()
                        }
                    }
                }
                .backport.bounceBasedOnSize()
            }
        }
        .navigationViewStyle(.stack)
    }

    @MainActor private var stack: some View {
        VStack(spacing: 20) {
            subViews
        }
        .padding()
        .onAppear {
            urlInput = UserDefaults.homepage ?? ""
        }
        .alert(isPresented: $showAlert) {
            switch alertType {
            case .success:
                Alert(
                    title: Text("homepageSaved"),
                    message: Text("homepageSavedDescription"),
                    dismissButton: .default(Text("ok"))
                )
            case .failed:
                Alert(
                    title: Text("invalidURL"),
                    message: Text("validationError"),
                    dismissButton: .default(Text("ok"))
                )
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if let url = URL(string: githubURL) {
                    Link("viewRepo", destination: url)
                }
            }
        }
    }

    private var subViews: some View {
        Group {
            if let iconFileName = Bundle.iconFileName, let icon = UIImage(named: iconFileName) {
                Image(uiImage: icon)
                    .resizable()
                    .frame(width: 64, height: 64)
                    .cornerRadius(10)
                    .accessibilityLabel("homepageIcon")
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
            .backport.disableWritingTools()
            Button {
                guard URLValidator.isValidURL(urlInput) else {
                    alertType = .failed
                    showAlert = true
                    return
                }
                UserDefaults.homepage = urlInput
                alertType = .success
                showAlert = true
            } label: {
                Text("save")
                    .font(.title)
            }
            .disabled(urlInput.trimmingCharacters(in: .whitespaces).isEmpty)
            Text("setupHelp")
        }
    }
}

#Preview {
    ContentView()
}
