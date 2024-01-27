//
//  VisualEffectView.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/24.
//

import AppKit
import SwiftUI

// Define a SwiftUI view that wraps NSVisualEffectView from AppKit
struct VisualEffectView: NSViewRepresentable {
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

// Use the VisualEffectView in your SwiftUI view
struct GlassBackgroundView: View {
    var body: some View {
        Text("Hello, World!")
            .frame(width: 300, height: 200)
            .background(VisualEffectView(material: .hudWindow, blendingMode: .withinWindow, state: .active))
            .cornerRadius(20)
    }
}

struct GlassBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        GlassBackgroundView()
    }
}
