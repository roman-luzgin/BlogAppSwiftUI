//
//  ArticleStore.swift
//  BlogAppSwiftUI
//
//  Created by Roman Luzgin on 21.07.21.
//

import SwiftUI
import Contentful
//import Combine
import Foundation

// change to your spaceID and accessToken
// you can find these in Settings -> API keys on Contentful
let spaceId = "youSpaceId"
let accessToken = "yourAccessToken"

let client = Client(spaceId: spaceId, accessToken: accessToken)

func getArray(id: String, completion: @escaping([Entry]) -> ()) {
    let query = Query.where(contentTypeId: id)
    try! query.order(by: Ordering(sys: .createdAt, inReverse: true)) // ordering the list of articles by created date
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        switch result {
            case .success(let array):
                DispatchQueue.main.async {
                    completion(array.items)
                }
            case .failure(let error):
                print(error)
        }
    }
}


class BlogPostsStore: ObservableObject {
    @Published var blogPosts: [BlogPost] = articleList
    
    init() {
        DispatchQueue.main.async {
            self.refreshView()
        }
    }
    func refreshView(){
        blogPosts = []
        DispatchQueue.main.async {
            getArray(id: "swiftBlog") {items in
                items.forEach {(item) in
                    self.blogPosts.append(
                        BlogPost(
                            title: item.fields["title"] as! String,
                            subtitle: item.fields["subtitle"] as! String,
                            image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: ""),
                            blogpost: item.fields["blogpost"] as? String ?? "",
                            featured: item.fields["featured"] as? Bool ?? false
                        )
                    )
                }
            }
        }
    }
}
