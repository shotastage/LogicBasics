//
//  TSWindowManager.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/25.
//

import AppKit

final class WindowManager {
    static func closeKeyWindow() {
        NSApplication.shared.keyWindow?.close()
    }
}
