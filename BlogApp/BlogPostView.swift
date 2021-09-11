//
//  ArticleView.swift
//  BlogAppSwiftUI
//
//  Created by Roman Luzgin on 23.07.21.
//

import SwiftUI
import SDWebImageSwiftUI

struct BlogPostView: View {
    
    var blogPost: BlogPost
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    WebImage(url: blogPost.image)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 310)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .clipped()
                    
                    VStack {
                        HStack {
                            Text(blogPost.title)
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(.primary)
                                .lineLimit(3)
                                .padding(.vertical, 15)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                        Text(blogPost.blogpost)
                            .multilineTextAlignment(.leading)
                            .font(.body)
                            .foregroundColor(Color.primary.opacity(0.9))
                            .padding(.bottom, 25)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal, 20)

                    Spacer()
                }
                .frame(maxWidth: .infinity)
                
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct BlogPostView_Previews: PreviewProvider {
    static let placeholder = BlogPost(title: "This is a placeholder", subtitle: "A subtitle for the placeholder", image: URL(string: "https://media.nature.com/lw800/magazine-assets/d41586-020-03053-2/d41586-020-03053-2_18533904.jpg"), blogpost: "Blog post")

    static var previews: some View {
        BlogPostView(blogPost: placeholder)
        
        BlogPostView(blogPost: placeholder)
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
            .preferredColorScheme(.dark)
    }
    
}
