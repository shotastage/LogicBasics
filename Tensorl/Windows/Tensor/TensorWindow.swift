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
                .frame(width: 1400, height: 800)
                .task {
                    if let window = NSApp.findWindow(.tensorWindowGroup) {
                        window.isMovableByWindowBackground = true
                    }
                }
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
        .register(.tensorWindowGroup)
        .titlebarAppearsTransparent()
        .transition(.documentWindow)
        .enableOpenWindow()
    }
}
