//
//  CreationViewController.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/24.
//

import Cocoa
import SwiftUI

class CreationViewController: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let hostingView = NSHostingView(rootView: CreationWindowView())
        hostingView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostingView)

        NSLayoutConstraint.activate([
            hostingView.topAnchor.constraint(equalTo: view.topAnchor),
            hostingView.leftAnchor.constraint(equalTo: view.leftAnchor),
            hostingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
}
