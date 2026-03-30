//
//  PostListView.swift
//  BunMo
//
//  Created by Joon on 3/28/26.
//

import SwiftUI

struct PostListView: View {
    let posts: [Post]
    let title: String

    init(contentType: ContentType) {
        self.posts = SampleDataSet.posts.filter { $0.contentType == contentType }
        self.title = contentType.displayName
    }

    init(posts: [Post], title: String) {
        self.posts = posts
        self.title = title
    }

    var body: some View {
        List(posts) { post in
            NavigationLink(destination: PostDetailView(post: post)) {
                PostRowView(post: post)
            }
        }
        .navigationTitle(title)
    }
}
