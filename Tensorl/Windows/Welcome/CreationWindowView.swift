//
//  CreationWindowView.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/16.
//

import SwiftData

import SwiftUI

struct CreationWindowView: View {
    @Environment(\.window) var window

    @State private var searchText = ""
    @State private var selectedView: String = "Home"

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ToolbarView(searchText: $searchText)
                    .frame(height: 44)

                HStack(spacing: 0) {
                    Sidebar(selectedView: $selectedView)
                        .frame(width: 60)
                    Spacer()
                    MainContentView(selectedView: selectedView)
                    Spacer()
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ToolbarView: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            Button(action: {
                NSApp.hide(nil)
            }) {
                Image(systemName: "cross")
            }
            Button(action: {}) {
                Image(systemName: "house")
            }
            Button(action: {}) {
                Image(systemName: "square.grid.2x2")
            }
            Spacer()
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText)
            }
            .frame(width: 200)

            Spacer()

            Button(action: {}) {
                Image(systemName: "bell")
            }
            Button(action: {}) {
                Image(systemName: "person.crop.circle")
            }
        }
        .padding(.horizontal)
    }
}

struct Sidebar: View {
    @Binding var selectedView: String

    var body: some View {
        VStack(spacing: 0) {
            SidebarItem(label: "Home", imageName: "house", isSelected: selectedView == "Home")
                .onTapGesture { selectedView = "Home" }
            SidebarItem(label: "New Project", imageName: "plus.square.on.square", isSelected: selectedView == "New Project")
                .onTapGesture { selectedView = "New Project" }
            SidebarItem(label: "Settings", imageName: "gearshape", isSelected: selectedView == "Settings")
                .onTapGesture { selectedView = "Settings" }
            SidebarItem(label: "About", imageName: "plus.square.on.square", isSelected: selectedView == "New Project")
                .onTapGesture { selectedView = "New Project" }
            Spacer()
        }
    }
}

struct SidebarItem: View {
    var label: String
    var imageName: String
    var isSelected: Bool

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundColor(isSelected ? .blue : .black)
            Text(label)
                .font(.caption)
                .frame(width: 60)
                .foregroundColor(isSelected ? .blue : .black)
        }
        .frame(width: 60, height: 90)
        .background(isSelected ? Color.blue.opacity(0.2) : Color.clear)
    }
}

struct MainContentView: View {
    var selectedView: String

    var body: some View {
        switch selectedView {
            case "Home":
                HomeView()
            case "New Project":
                Button("Open Main Window") {
                    openSecondWindow()
                }
            case "Settings":
                Button("Open Setting") {
                    NSApp.openWindow(.settingWindowGroup)
                }
            default:
                Text("Select a view")
        }
    }

    private func openSecondWindow() {
        WindowManager.closeKeyWindow()
        NSApp.openWindow(.tensorWindowGroup)
    }
}

struct DocumentsGridView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 20)], spacing: 20) {
                ForEach(0 ..< 10) { _ in
                    DocumentCard()
                }
            }
            .padding()
        }
        .toolbar {
            // ツールバーに追加するアイテム
        }
    }
}

struct DocumentCard: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.2))
                .frame(height: 120)
            Text("Document Name")
        }
        .frame(width: 160, height: 200)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
        .shadow(radius: 5)
    }
}

// #Preview {
//    ContentView(shownWindow: <#Binding<TensorlApp.WindowType>#>)
//        .modelContainer(for: Item.self, inMemory: true)
// }
