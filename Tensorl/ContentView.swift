//
//  ContentView.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/16.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    @State private var searchText = ""

       var body: some View {

           NavigationView {
               Sidebar()
               DocumentsGridView()
           }
           .toolbar {
                       // Left Icon Group
                       ToolbarItemGroup(placement: .navigation) {
                           Button(action: {}) {
                               Image(systemName: "house")
                           }
                           Button(action: {}) {
                               Image(systemName: "square.grid.2x2")
                           }
                       }
                       
                       // Center Serach Bar
                       ToolbarItemGroup(placement: .principal) {
                           HStack {
                               Image(systemName: "magnifyingglass")
                               TextField("Search", text: $searchText)
                           }
                       }
                       
                       // Right Icons Group
                       ToolbarItemGroup(placement: .automatic) {
                           Button(action: {}) {
                               Image(systemName: "bell")
                           }
                           Button(action: {}) {
                               Image(systemName: "person.crop.circle")
                           }
                       }
                   }
       }
}

struct Sidebar: View {
    var body: some View {
        List {
                    NavigationLink(destination: HomeView()) {
                        SidebarItem(label: "Home", imageName: "house")
                    }
                    NavigationLink(destination: HomeView()) {
                        SidebarItem(label: "New Project", imageName: "plus.square.on.square")
                    }
                    NavigationLink(destination: HomeView()) {
                        SidebarItem(label: "Recent", imageName: "clock")
                    }
                    NavigationLink(destination: HomeView()) {
                        SidebarItem(label: "About", imageName: "info.circle")
                    }
                }
        .listStyle(SidebarListStyle())
        .frame(width: 60)

    }
    
    func toggleSidebar() {
    }
}

struct SidebarItem: View {
    var label: String
    var imageName: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            Text(label)
                .font(.caption)
                .frame(width: 60)
        }
        .frame(width: 60, height: 90)
    }
}


struct DocumentsGridView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 20)], spacing: 20) {
                ForEach(0..<10) { _ in
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


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
