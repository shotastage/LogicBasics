//
//  SpreadsheetView.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/20.
//

import AppKit
import Foundation
import SwiftUI
import WindowManagement

struct SpreadsheetView: View {
    @Environment(\.window) var window

    @State private var data = Array(repeating: Array(repeating: "", count: 10), count: 20)

    var body: some View {
        VStack {
            Text("Toolbar Area")
            Text("Spreadsheet Area")
            Text("Bottom bar area")
        }
        .frame(width: 900.0, height: 800.0)
    }
}

struct SpreadsheetView_Previews: PreviewProvider {
    static var previews: some View {
        SpreadsheetView()
    }
}
