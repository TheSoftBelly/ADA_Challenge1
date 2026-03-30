//
//  HighlightsImages.swift
//  BunMo
//
//  Created by Joon on 3/26/26.
//

import SwiftUI

struct HighlightsImages: View {
    var posts: [Post] {
        Array(SampleDataSet.posts
            .sorted { $0.currentParticipants.count > $1.currentParticipants.count }
            .prefix(5))
    }

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 4) {
                ForEach(posts) { post in
                    NavigationLink(destination: PostDetailView(post: post)) {
                        BigCardView(post: post)
                    }
                    .buttonStyle(.plain)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .padding(.leading, 8)
    }
}

#Preview {
    HighlightsImages()
}

//폰트위계, 레이아웃잡기 4의배수
