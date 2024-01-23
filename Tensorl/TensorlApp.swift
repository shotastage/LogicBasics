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
    @State private var shownWindow: WindowType = .creation

    var body: some Scene {
        WindowGroup {
            switch shownWindow {
                case .creation:
                    ContentView(shownWindow: $shownWindow)
                        .frame(minWidth: 800, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)

                case .main:
                    SpreadsheetView()
                        .frame(minWidth: 1500, maxWidth: .infinity, minHeight: 900, maxHeight: .infinity)
            }
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
