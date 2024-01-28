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
            // Creation Window
            WelcomeWindow()

            /*
             WindowGroup(id: SceneID.creationWindowGroup.id) {
                 CreationWindowView()
                     .frame(maxWidth: .infinity, maxHeight: .infinity)
                     .background(VisualEffectView(material: .hudWindow, blendingMode: .withinWindow, state: .active))
                     .injectWindow(.creationWindowGroup)

             }
             .register(.creationWindowGroup)
             .transition(.default)
             .windowToolbarStyle(.unifiedCompact(showsTitle: false))
             .titlebarAppearsTransparent()
             .windowButton(.zoomButton, hidden: true)
             .windowButton(.miniaturizeButton, hidden: true)
             .enableOpenWindow()
             .commands {
                 CommandGroup(replacing: .windowList) {}
             }
              */

            // Main Window
            TensorWindow()
            
            /*
            WindowGroup(id: SceneID.tensorWindowGroup.id) {
                TensorWindowView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(VisualEffectView(material: .hudWindow, blendingMode: .withinWindow, state: .active))
                    .injectWindow(.tensorWindowGroup)
            }
            .register(.tensorWindowGroup)
            .titlebarAppearsTransparent()
            .transition(.documentWindow)
             */
            
            // Settings Window
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
