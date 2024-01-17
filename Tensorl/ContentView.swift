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
            Text("Home")
            Text("New Project")
            Text("Recent")
            Text("About")
        }
        .listStyle(SidebarListStyle())
    }
    
    func toggleSidebar() {
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
