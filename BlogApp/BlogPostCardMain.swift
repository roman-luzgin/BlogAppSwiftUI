//
//  ArticleCardMain.swift
//  BlogAppSwiftUI
//
//  Created by Roman Luzgin on 23.07.21.
//

import SwiftUI
import SDWebImageSwiftUI

struct BlogPostCardMain: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var blogPost: BlogPost
    
    var body: some View {
        VStack(alignment: .leading) {
            WebImage(url: blogPost.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 220)
                .frame(maxWidth: UIScreen.main.bounds.width - 80)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            VStack(spacing: 6) {
                HStack {
                    Text(blogPost.title)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(Font.title2.bold())
                        .foregroundColor(.primary)
                    Spacer()
                }
                HStack {
                    Text(blogPost.subtitle)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .frame(height: 110)
        }
        .padding(15)
        .background(colorScheme == .dark ? Color(hex: "#121212") : Color.white)
        .frame(maxWidth: UIScreen.main.bounds.width - 50, alignment: .leading)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: colorScheme == .dark ? .white.opacity(0.01) : .black.opacity(0.1), radius: 15, x: 0, y: 5)
    }
}

struct ArticleCardMain_Previews: PreviewProvider {
    static let store = BlogPostsStore()
    static let placeholder = BlogPost(title: "This is a placeholder", subtitle: "A subtitle for the placeholder", image: URL(string: "https://media.nature.com/lw800/magazine-assets/d41586-020-03053-2/d41586-020-03053-2_18533904.jpg"), blogpost: "Blog post")
    
    static var previews: some View {
        BlogPostCardMain(blogPost: placeholder)
            .environmentObject(store)
        
        BlogPostCardMain(blogPost: placeholder)
            .environmentObject(store)
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
            .preferredColorScheme(.dark)
    }
}
