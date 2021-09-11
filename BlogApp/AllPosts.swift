//
//  AllArticles.swift
//  BlogAppSwiftUI
//
//  Created by Roman Luzgin on 23.07.21.
//

import SwiftUI

struct AllPosts: View {
    @EnvironmentObject var store: BlogPostsStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.blogPosts) {post in
                    NavigationLink(destination: BlogPostView(blogPost: post)) {
                        BlogPostCardList(blogPost: post)
                    }
                }
            }
            .navigationTitle("All blog posts")
            .listStyle(InsetListStyle())
        }
    }
}

struct AllPosts_Previews: PreviewProvider {
    static var previews: some View {
        AllPosts()
    }
}
