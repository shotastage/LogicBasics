//
//  WindowClose.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/31.
//

import SwiftUI


struct WindowClose: View {

    @State var isLiked: Bool = false

    var body: some View {
        Button(action: {
            print("Hello")
        }, label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .font(.system(size: 24))
                .padding(10)
        })
        .buttonStyle(.plain)
        .background(Color.red)
        .cornerRadius(100)
        .frame(width: 100, height: 100)
    }
}


#Preview {
    WindowClose()
}
