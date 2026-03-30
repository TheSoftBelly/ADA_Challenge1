//
//  MeetingInfoBox.swift
//  BunMo
//
//  Created by Joon on 3/25/26.
//

import SwiftUI

struct MeetingInfoBox: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if let imageName = post.image {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 120)
                    .clipped()
                    .cornerRadius(12)
            } else {
                Rectangle()
                    .fill(post.contentType.color.opacity(0.3))
                    .frame(height: 120)
                    .cornerRadius(12)
                    .overlay(
                        Image(systemName: post.contentType.icon)
                            .font(.largeTitle)
                            .foregroundStyle(post.contentType.color)
                    )
            }

            Text(post.title)
                .font(.subheadline)
                .bold()
                .lineLimit(2)

            HStack {
                Image(systemName: "person.2.badge.plus.fill")
                    .foregroundStyle(Color.blue)

                Text("현재 \(post.currentParticipants.count)명 참여중")
                    .font(.footnote)
                    .foregroundStyle(.gray)

                Spacer()
            }
        }
        .padding(8)
    }
}

#Preview {
    MeetingInfoBox(post: SampleDataSet.posts[0])
}
