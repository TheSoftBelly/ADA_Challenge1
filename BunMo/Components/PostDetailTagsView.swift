//
//  PostDetailTagsView.swift
//  BunMo
//
//  Created by Joon on 3/29/26.
//

import SwiftUI

struct PostDetailTagsView: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Divider()

            Text("태그")
                .font(.subheadline.bold())
                .foregroundStyle(.secondary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(post.tags, id: \.self) { tag in
                        Text("#\(tag)")
                            .font(.caption)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(post.contentType.color.opacity(0.15))
                            .foregroundStyle(post.contentType.color)
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
}
