//
//  TensorlApp.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/24.
//

import AppKit
import SwiftData
import SwiftUI

@main
struct TensorlApp: App {
    @State private var shownWindow: WindowType = .creation

    var body: some Scene {
        WindowGroup {
            CreationWindowView()
        }
        .windowStyle(.hiddenTitleBar)
        .commands {
            CommandGroup(replacing: .newItem) {
                Button("New") {
                    print("NEW")
                }
                Button("New from template") {
                    print("TEMPLATE")
                }
                Button("Open") {
                    print("OPEN")
                }
                Button("Open recent...") {
                    print("OPEN RECENT")
                }
            }
        }
    }

    enum WindowType {
        case creation
        case main
    }
}
