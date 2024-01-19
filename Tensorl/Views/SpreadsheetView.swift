//
//  SpreadsheetView.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/20.
//

import Foundation
import SwiftUI

struct SpreadsheetView: View {
    @State private var data = Array(repeating: Array(repeating: "", count: 10), count: 20)

    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 10)) {
                ForEach(0..<20, id: \.self) { row in
                    ForEach(0..<10, id: \.self) { column in
                        TextField("", text: $data[row][column])
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(minWidth: 80, minHeight: 30)
                    }
                }
            }
        }
    }
}

struct SpreadsheetView_Previews: PreviewProvider {
    static var previews: some View {
        SpreadsheetView()
    }
}
