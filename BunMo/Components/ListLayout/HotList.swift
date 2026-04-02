//
//  HotList.swift
//  BunMo
//
//  Created by Joon on 3/25/26.
//

import SwiftUI

struct HotList: View {
    @EnvironmentObject var userStore: UserStore

    var hotPosts: [Post] {
        Array(userStore.posts
            .sorted { $0.currentParticipants.count > $1.currentParticipants.count }
            .prefix(10))
    }

    var body: some View {
        VStack {
            HStack {
                Text("HOT")
                    .font(.title.bold())
                    .lineLimit(1)
                Spacer()
                NavigationLink(destination: PostListView(posts: hotPosts, title: "HOT")) {
                    Image(systemName: "arrowshape.forward.circle.fill")
                        .font(.title2)
                }
                .fixedSize()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(hotPosts) { post in
                        NavigationLink(destination: PostDetailView(post: post)) {
                            MeetingInfoBox(post: post)
                                .frame(width: 180, height: 240)
                                .cornerRadius(8)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
        }
        .padding(8)
    }
}

#Preview {
    HotList()
        .environmentObject(UserStore())
}
