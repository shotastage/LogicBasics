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
    @NSApplicationDelegateAdaptor var appdelegate: AppDelegate

    @Environment(\.openWindow)
    var openWindow

    var body: some Scene {
        #if os(macOS)
        Window("Statistics", id: "stats") {
            CreationWindowView()
        }
        #endif
    }
}
