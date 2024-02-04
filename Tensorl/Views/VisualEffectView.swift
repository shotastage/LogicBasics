//
//  VisualEffectView.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/24.
//

import AppKit
import Cocoa
import SwiftUI

struct VisualEffectBlur: NSViewRepresentable {
    var material: NSVisualEffectView.Material
    var blendingMode: NSVisualEffectView.BlendingMode
    var state: NSVisualEffectView.State

    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.material = material
        view.blendingMode = blendingMode
        view.state = state
        return view
    }

    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        nsView.material = material
        nsView.blendingMode = blendingMode
        nsView.state = state
    }
}

class BlurBackground {
    static func apply(to window: NSWindow) {
        // Blue effect
        let visualEffectView = NSVisualEffectView(frame: window.contentView?.bounds ?? NSRect.zero)
        visualEffectView.blendingMode = .behindWindow
        visualEffectView.state = .active
        visualEffectView.material = .hudWindow
        window.contentView?.addSubview(visualEffectView, positioned: .below, relativeTo: nil)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            visualEffectView.topAnchor.constraint(equalTo: window.contentView!.topAnchor),
            visualEffectView.bottomAnchor.constraint(equalTo: window.contentView!.bottomAnchor),
            visualEffectView.leadingAnchor.constraint(equalTo: window.contentView!.leadingAnchor),
            visualEffectView.trailingAnchor.constraint(equalTo: window.contentView!.trailingAnchor),
        ])
    }
}
