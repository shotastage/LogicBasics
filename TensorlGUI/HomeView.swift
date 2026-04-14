//
//  HomeView.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/19.
//

#if os(macOS)
import AppKit
#endif
import SwiftUI

struct HomeView: View {
    var body: some View {
        Button("Open Spreadsheet Windows") {
            WindowManager.closeKeyWindow()
            NSApp.openWindow(.tensorWindowGroup)
        }
    }
}
