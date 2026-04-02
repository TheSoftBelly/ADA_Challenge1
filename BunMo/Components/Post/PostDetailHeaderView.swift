//
//  PostDetailHeaderView.swift
//  BunMo
//
//  Created by Joon on 3/29/26.
//

import SwiftUI

struct PostDetailHeaderView: View {
    let post: Post

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if let imageName = post.image {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .clipped()
            } else {
                Rectangle()
                    .foregroundStyle(
                        LinearGradient(
                            colors: [post.contentType.color.opacity(0.8), post.contentType.color],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(height: 300)
            }


            LinearGradient(
                colors: [.clear, .black.opacity(0.55)],
                startPoint: .center,
                endPoint: .bottom
            )
            .frame(height: 300)


            HStack(spacing: 6) {
                Image(systemName: post.contentType.icon)
                Text(post.contentType.displayName)
            }
            .font(.caption.bold())
            .foregroundStyle(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(.white.opacity(0.2))
            .clipShape(Capsule())
            .padding(.leading, 20)
            .padding(.bottom, 20)
        }
        .frame(height: 300)
        .ignoresSafeArea(edges: .top)
    }
}
