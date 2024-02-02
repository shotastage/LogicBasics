//
//  TensorWindowView.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/20.
//

import AppKit
import Foundation
import SwiftUI
import WindowManagement

struct TensorWindowView: View {
    @Environment(\.window) var window

    @State private var data = Array(repeating: Array(repeating: "", count: 10), count: 20)

    var body: some View {
        VStack {
            Text("<<TOOLBAR AREA>>")
                .frame(maxWidth: .infinity, maxHeight: 90.0)
                .background(Color.blue)
            SpreadsheetView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Spacer()
            Text("<<BOTTOM BAR AREA>>")
                .frame(maxWidth: .infinity, maxHeight: 20.0)
                .background(Color.red)
        }
        .padding(.horizontal, 0.0)
    }
}

struct SpreadsheetView: View {
    var body: some View {
        HStack {
            Text("SpreadsheetView")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .foregroundColor(.black)
        .cornerRadius(10)
    }
}

struct TableView: View {
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 10) // 10列のテーブル
    let data: [[String]] = [
        ["1", "2", "3", "4", "5", "6", "7", "8"],
        ["1", "2", "3", "4", "5", "6", "7", "8"],
        ["1", "2", "3", "4", "5", "6", "7", "8"],
        ["1", "2", "3", "4", "5", "6", "7", "8"],
        ["1", "2", "3", "4", "5", "6", "7", "8"],
        ["1", "2", "3", "4", "5", "6", "7", "8"],
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                ForEach(0 ..< data.count, id: \.self) { rowIndex in
                    ForEach(0 ..< data[rowIndex].count, id: \.self) { columnIndex in
                        Text(data[rowIndex][columnIndex])
                            .frame(minWidth: 100, minHeight: 30) // セルのサイズを調整する
                            .overlay(Rectangle().stroke(Color.black, lineWidth: 1)) // セルの境界線
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TensorWindowView()
}
