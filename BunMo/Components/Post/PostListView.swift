//
//  PostListView.swift
//  BunMo
//
//  Created by Joon on 3/28/26.
//

import SwiftUI

struct PostListView: View {
    private let contentType: ContentType?
    private let fixedPosts: [Post]?
    let title: String

    @EnvironmentObject var userStore: UserStore

    var posts: [Post] {
        if let contentType {
            return userStore.posts.filter { $0.contentType == contentType }
        }
        return fixedPosts ?? []
    }

    init(contentType: ContentType) {
        self.contentType = contentType
        self.fixedPosts = nil
        self.title = contentType.displayName
    }

    init(posts: [Post], title: String) {
        self.contentType = nil
        self.fixedPosts = posts
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
