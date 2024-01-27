//
//  TensorlApp.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/24.
//

import AppKit
import SwiftUI
import WindowManagement

@main
struct TensorlApp: App {
    @NSApplicationDelegateAdaptor var delegate: AppDelegate

    init() {
        // - enableWindowSizeSaveOnQuit(true)
    }

    var body: some Scene {
        Group {
            WindowGroup(id: SceneID.creationWindowGroup.id) {
                CreationWindowView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(VisualEffectView(material: .hudWindow, blendingMode: .withinWindow, state: .active))
                    .injectWindow(.creationWindowGroup)
            }
            .register(.creationWindowGroup)
            .titlebarAppearsTransparent()
            .windowStyle(HiddenTitleBarWindowStyle())
            .commands {
                CommandGroup(replacing: .windowList) {}
            }
            .transition(.default)
            .windowButton(.zoomButton, hidden: true)
            .windowButton(.miniaturizeButton, hidden: true)
            .enableOpenWindow()
            WindowGroup(id: SceneID.tensorWindowGroup.id) {
                TensorWindowView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(VisualEffectView(material: .hudWindow, blendingMode: .withinWindow, state: .active))
                    .injectWindow(.tensorWindowGroup)
            }
            .register(.tensorWindowGroup)
            .titlebarAppearsTransparent()
            .transition(.documentWindow)
            WindowGroup(id: SceneID.settingWindowGroup.id) {
                SettingsView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.regularMaterial)
                    .injectWindow(.settingWindowGroup)
            }
            .windowStyle(HiddenTitleBarWindowStyle())
            .commands {
                CommandGroup(replacing: .windowList) {}
            }
            .titlebarAppearsTransparent()
            .register(.settingWindowGroup)
            .transition(.default)
        }
        .environment(\.controlSize, .large)
    }
}
