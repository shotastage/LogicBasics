//
//  AppDelegate.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/23.
//

import AppKit
import Cocoa
import SwiftUI

final class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false
        )
        window.center()
        window.setFrameAutosaveName("Main Window")

        // CreationViewControllerの作成
        let creationViewController = CreationViewController()

        // ウィンドウにViewControllerを設定
        window.contentViewController = creationViewController

        // ウィンドウを表示
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        true
    }
}
