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
        enableWindowSizeSaveOnQuit(true)
    }

    var body: some Scene {
        Group {
            WindowGroup(id: SceneID.creationWindowGroup.id) {
                CreationWindowView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.regularMaterial)
                    .injectWindow(.creationWindowGroup)
            }
            .register(.creationWindowGroup)
            .titlebarAppearsTransparent()
            .windowButton(.zoomButton, hidden: true)
            .windowButton(.miniaturizeButton, hidden: true)
            .enableOpenWindow()
            WindowGroup(id: SceneID.spreadWindowGroup.id) {
                SpreadsheetView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.regularMaterial)
                    .injectWindow(.spreadWindowGroup)
            }
            .register(.spreadWindowGroup)
            .transition(.documentWindow)
        }
        .environment(\.controlSize, .large)
    }
}
