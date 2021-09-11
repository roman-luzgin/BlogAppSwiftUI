//
//  ContentView.swift
//  BlogApp
//
//  Created by Roman Luzgin on 11.09.21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var store = BlogPostsStore()
    
    var body: some View {
        TabView {
            MainView()
                .environmentObject(store)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            AllPosts()
                .environmentObject(store)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("See all")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
