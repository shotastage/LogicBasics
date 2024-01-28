//
//  NSApp+openWindow.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/27.
//

import AppKit
import SwiftUI
import WindowManagement

extension NSApplication {
    func findWindow(_ id: SceneID) -> NSWindow? {
        windows.first { $0.identifier?.rawValue == id.id }
    }
}
