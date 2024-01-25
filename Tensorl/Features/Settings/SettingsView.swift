//
//  SettingsView.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/24.
//

import Combine
import Foundation
import SwiftUI

final class Settings: ObservableObject {
    static let shared: Settings = .init()
}

import AppKit
import Foundation
import SwiftUI
import WindowManagement

struct SettingsView: View {
    @Environment(\.window) var window

    @State private var data = Array(repeating: Array(repeating: "", count: 10), count: 20)

    var body: some View {
        VStack {
            Text("Setting Window")
        }
        .frame(width: 900.0, height: 800.0)
    }
}

#Preview {
    SpreadsheetView()
}
