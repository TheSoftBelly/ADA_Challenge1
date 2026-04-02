//
//  RecommandList.swift
//  BunMo
//
//  Created by Joon on 3/26/26.
//

import SwiftUI

struct RecommandList: View {
    var recommandPosts: [Post] {
        Array(SampleDataSet.posts
            .sorted { $0.writedDate > $1.writedDate }
            .prefix(10))
    }

    var body: some View {
        VStack {
            HStack {
                Text("추천 모임")
                    .font(.title.bold())
                    .lineLimit(1)
                Spacer()
                NavigationLink(destination: PostListView(posts: recommandPosts, title: "추천 모임")) {
                    Image(systemName: "arrowshape.forward.circle.fill")
                        .font(.title2)
                }
                .fixedSize()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(recommandPosts) { post in
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
    RecommandList()
}
