//
//  HomeView.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/19.
//

import AppKit
import SwiftUI

struct HomeView: View {
    @Binding var shownWindow: TensorlApp.WindowType

    var body: some View {
        Button("Open Spreadsheet Windows") {
            shownWindow = .main
        }
    }
}
