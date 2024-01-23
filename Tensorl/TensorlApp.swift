//
//  TensorlApp.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/16.
//

import AppKit
import SwiftData
import SwiftUI

class CustomWindowController: NSWindowController {
    init(window: NSWindow, contentViewController: NSViewController) {
        super.init(window: window)
        window.styleMask = [.closable, .resizable, .miniaturizable, .fullSizeContentView]
        window.titleVisibility = .hidden
        window.titlebarAppearsTransparent = true
        window.contentView = contentViewController.view
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

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
    }
}
