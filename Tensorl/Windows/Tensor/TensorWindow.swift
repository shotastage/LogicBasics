//
//  TensorWindow.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/27.
//

import AppKit
import Cocoa
import SwiftUI
import WindowManagement

struct TensorWindow: Scene {
    var body: some Scene {
        Window("Get Started!", id: SceneID.tensorWindowGroup.id) {
            TensorWindowView()
                .task {
                    if let window = NSApp.findWindow(.tensorWindowGroup) {
                        window.isMovableByWindowBackground = true
                        BlurBackground.apply(to: window)
                    }
                }
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.automatic)
        .register(.tensorWindowGroup)
        .titlebarAppearsTransparent()
        .transition(.documentWindow)
        .enableOpenWindow()
    }
}
