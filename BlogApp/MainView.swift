//
//  MainView.swift
//  BlogAppSwiftUI
//
//  Created by Roman Luzgin on 23.07.21.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var store: BlogPostsStore
    @Environment(\.colorScheme) var colorScheme
    
    var featuredPosts: [BlogPost] {
        return store.blogPosts.filter {$0.featured == true}
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                // featured article
                if featuredPosts.count > 0 {
                    VStack {
                        HStack {
                            Text("Featured posts")
                                .font(.title.bold())
                            Spacer()
                        }
                        LazyVStack {
                            ForEach(featuredPosts) {post in
                                NavigationLink(destination: BlogPostView(blogPost: post)) {
                                    BlogPostCardMain(blogPost: post)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 30)
                }
                // latest articles
                VStack {
                    HStack {
                        Text("Latest posts")
                            .font(.title.bold())
                        Spacer()
                    }
                    .padding(.horizontal, 15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 15) {
                            if store.blogPosts.count >= 3 {
                                ForEach(store.blogPosts[0...2]) {post in
                                    NavigationLink(destination: BlogPostView(blogPost: post)) {
                                        BlogPostCardMain(blogPost: post)
                                    }
                                }
                                
                            } else {
                                ForEach(store.blogPosts[0..<store.blogPosts.count]) {post in
                                    NavigationLink(destination: BlogPostView(blogPost: post)) {
                                        BlogPostCardMain(blogPost: post)
                                    }
                                }
                            }
                        }
                        .padding(.leading, 15)
                        .padding(.trailing, 30)
                    }
                    .frame(height: 420)
                    
                    Spacer()
                }
                .padding(.bottom, 40)
                
            }
            .navigationBarTitle("Home")
            .navigationBarItems(
                trailing: Button(action: {store.refreshView()}) { Image(systemName: "arrow.clockwise.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
            })
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
