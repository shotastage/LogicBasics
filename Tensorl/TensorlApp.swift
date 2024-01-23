//
//  TensorlApp.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/16.
//

import AppKit
import SwiftData
import SwiftUI

@main
struct TensorlApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.hiddenTitleBar)
        .modelContainer(sharedModelContainer)
        .commands {
            CommandGroup(replacing: .newItem) {
                Button("Open New Window") {
                    openNewWindow()
                }
            }
        }
    }
}

func openNewWindow() {
    let windowSize = NSRect(x: 0, y: 0, width: 1400, height: 900)
    let newWindow = NSWindow(contentRect: windowSize, styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView], backing: .buffered, defer: false)
    newWindow.center()

    let windowController = CustomWindowController(window: newWindow, rootView: SpreadsheetView())
    windowController.window?.titleVisibility = .hidden
    windowController.window?.titlebarAppearsTransparent = true
    windowController.window?.makeKeyAndOrderFront(nil)
    NSApp.activate(ignoringOtherApps: true)
}
