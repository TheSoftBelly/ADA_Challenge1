//
//  HomeView.swift
//  BunMo
//
//  Created by Joon on 3/25/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userStore : UserStore
    
    var joinedPosts: [Post] {
        userStore.posts.filter { post in
            userStore.currentUser?.joinedPostIDs.contains(post.id) ?? false
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        JoinCardView(posts: joinedPosts)
                        
                        HighlightsImages()
                        Divider()
                            .padding(.horizontal, 8)
                        HotList()
                        Divider()
                            .padding(.horizontal, 8)
                        ContentTypeGridView()
                        Divider()
                            .padding(.horizontal, 8)
                        RecommandList()
                    }
                }
                Spacer()
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    HomeView()
}
