//
//  WindowClose.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/31.
//

import SwiftUI

struct CloseButtonView: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .foregroundColor(.red)
                    .frame(width: 16, height: 16)
                Text("X")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .shadow(radius: 1)
    }
}

#Preview {
    CloseButtonView {
        print("Hello")
    }
}
