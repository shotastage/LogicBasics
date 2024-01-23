//
//  WindowController.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/23.
//

import AppKit
import SwiftUI

class CustomWindowController: NSWindowController {
    init(window: NSWindow?, rootView: some View) {
        let hostingController = NSHostingController(rootView: rootView)
        super.init(window: window)
        window?.contentViewController = hostingController
        window?.styleMask = [.closable, .resizable, .miniaturizable, .fullSizeContentView]
        window?.titleVisibility = .hidden
        window?.titlebarAppearsTransparent = true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
