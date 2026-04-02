//
//  JoinCardView.swift
//  BunMo
//
//  Created by Joon on 3/30/26.
//

import SwiftUI

struct JoinCardView: View {
    let posts: [Post]
    
    var formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "M월 d일 HH:mm"
        return f
    }()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.purple)
                Text("참여한 모임")
                    .font(.title3.bold())
                    .lineLimit(1)
                Spacer()
                if !posts.isEmpty {
                    Text("\(posts.count)개")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal, 8)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    if posts.isEmpty {
                        emptyPlaceholderCard
                    } else {
                        ForEach(posts) { post in
                            joinCard(post: post)
                        }
                    }
                }
                .padding(.horizontal, 8)
            }
        }
        .padding(.vertical, 12)
    }

    var emptyPlaceholderCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 4) {
                Image(systemName: "plus.circle")
                    .font(.caption2.bold())
                Text("모임 카테고리")
                    .font(.caption2.bold())
            }
            .foregroundStyle(.secondary)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.secondary.opacity(0.08))
            .clipShape(Capsule())

            Text("참여한 모임이\n여기에 표시돼요")
                .font(.subheadline.bold())
                .foregroundStyle(.secondary.opacity(0.5))
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            Label("모임 일시", systemImage: "clock.fill")
                .font(.caption)
                .foregroundStyle(.tertiary)

            Label("참여 인원", systemImage: "person.2.fill")
                .font(.caption)
                .foregroundStyle(.tertiary)
        }
        .frame(width: 280)
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.secondary.opacity(0.04))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(style: StrokeStyle(lineWidth: 1.5, dash: [6, 4]))
                        .foregroundStyle(Color.secondary.opacity(0.25))
                )
        )
    }
    
    @ViewBuilder
    func joinCard(post: Post) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 4) {
                Image(systemName: post.contentType.icon)
                    .font(.caption2.bold())
                Text(post.contentType.displayName)
                    .font(.caption2.bold())
            }
            .foregroundStyle(post.contentType.color)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(post.contentType.color.opacity(0.12))
            .clipShape(Capsule())
            
            Text(post.title)
                .font(.subheadline.bold())
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            Label(formatter.string(from: post.meetingTime), systemImage: "clock.fill")
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Label("\(post.currentParticipants.count) / \(post.maxParticipants)명", systemImage: "person.2.fill")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(width: 280,)
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(post.contentType.color.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(post.contentType.color.opacity(0.2), lineWidth: 1)
                )
        )
    }
}
