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
    @State private var alertType: AlertType = .about

    @MainActor private var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }

    private var infoIcon: String {
        if #available(iOS 26.0, *) {
            return "info"
        } else {
            return "info.circle"
        }
    }

    private var widthDivider: CGFloat {
        ProcessInfo.processInfo.isiOSAppOnMac ? 1.5 : 1.7
    }

    @Environment(\.openURL) private var openURL

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
                                .frame(width: geometry.size.width / widthDivider)
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
            case .about:
                aboutAlert
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    alertType = .about
                    showAlert = true
                } label: {
                    Image(systemName: infoIcon)
                        .accessibilityLabel("aboutButton")
                }
                .accessibilityIdentifier("About button")
            }
        }
    }

    private var subViews: some View {
        Group {
            Image("AppImage")
                .resizable()
                .frame(width: 64, height: 64)
                .accessibilityLabel("homepageIcon")
                .accessibilityIdentifier("Homepage icon")
            Text("title")
                .font(.title)
                .accessibilityIdentifier("Title")
            TextField(
                "url",
                text: $urlInput
            )
            .keyboardType(.URL)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .textFieldStyle(.roundedBorder)
            .accessibilityIdentifier("URL input")
            .backport.disableWritingTools()
            Button {
                if !URLValidator.isCompleteURL(urlInput) {
                    urlInput = "http://" + urlInput
                }
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
            .accessibilityIdentifier("Save button")
            .disabled(urlInput.trimmingCharacters(in: .whitespaces).isEmpty)
            Text("setupHelp")
                .accessibilityIdentifier("Help text")
        }
    }

    private var aboutAlert: Alert {
        Alert(
            title: Text("appName"),
            message: Text("version \(UIApplication.appVersion ?? "unknown")") + Text(verbatim: "\n") + Text("copyright"),
            primaryButton: .cancel(Text("close")),
            secondaryButton: .default(Text("support")) {
                if let url = Constants.supportURL {
                    openURL(url)
                }
            }
        )
    }
}

#Preview {
    ContentView()
}

/// The type of alert to show
enum AlertType {
    case success, failed, about
}
