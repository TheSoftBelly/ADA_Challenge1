//
//  HotList.swift
//  BunMo
//
//  Created by Joon on 3/25/26.
//

import SwiftUI

struct HotList: View {
    var hotPosts: [Post] {
        Array(SampleDataSet.posts
            .sorted { $0.currentParticipants.count > $1.currentParticipants.count }
            .prefix(10))
    }

    var body: some View {
        VStack {
            HStack {
                Text("HOT")
                    .font(.title.bold())
                Spacer()
                NavigationLink(destination: PostListView(posts: hotPosts, title: "HOT")) {
                    Image(systemName: "arrowshape.forward.circle.fill")
                        .font(.title2)
                }
            }
            .padding(8)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(hotPosts) { post in
                        NavigationLink(destination: PostDetailView(post: post)) {
                            MeetingInfoBox(post: post)
                                .frame(width: 180, height: 240)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
        }
    }
}

#Preview {
    HotList()
}
