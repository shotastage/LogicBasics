//
//  WelcomeWindow.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/27.
//

import AppKit
import SwiftUI
import WindowManagement

struct WelcomeWindow: Scene {
    var body: some Scene {
        Window("Get Started!", id: SceneID.creationWindowGroup.id) {
            CreationWindowView()
                .frame(width: 740, height: 432)
                .task {
                    if let window = NSApp.findWindow(.creationWindowGroup) {
                        window.isMovableByWindowBackground = true

                        BlurBackground.apply(to: window)

                        window.standardWindowButton(.closeButton)?.isHidden = true
                        window.standardWindowButton(.miniaturizeButton)?.isHidden = true
                        window.standardWindowButton(.zoomButton)?.isHidden = true
                    }
                }
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
    }
}
