//
//  MeetingInfoBox.swift
//  BunMo
//
//  Created by Joon on 3/25/26.
//

import SwiftUI

struct MeetingInfoBox: View {
    let post: Post

    private var participantRatio: Double {
        guard post.maxParticipants > 0 else { return 0 }
        return Double(post.currentParticipants.count) / Double(post.maxParticipants)
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            
            if let imageName = post.image {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            } else {
                LinearGradient(
                    colors: [post.contentType.color.opacity(0.6), post.contentType.color],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                Image(systemName: post.contentType.icon)
                    .font(.system(size: 72, weight: .bold))
                    .foregroundStyle(.white.opacity(0.15))
                    .rotationEffect(.degrees(-15))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .offset(y: -20)
            }

            LinearGradient(
                colors: [.clear, .black.opacity(0.72)],
                startPoint: .center,
                endPoint: .bottom
            )

            HStack(spacing: 5) {
                Image(systemName: post.contentType.icon)
                    .font(.system(size: 9, weight: .heavy))
                Text(post.contentType.displayName)
                    .font(.system(size: 10, weight: .heavy))
                    .kerning(0.3)
            }
            .foregroundStyle(.white)
            .padding(8)
            .background(post.contentType.color)
            .clipShape(Capsule())
            .shadow(color: post.contentType.color.opacity(0.5), radius: 6, y: 2)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.vertical,24)
            .padding(.horizontal, 8)

            VStack(alignment: .leading, spacing: 8) {

                Text(post.title)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.white)
                    .lineLimit(2)
                    .shadow(color: .black.opacity(0.3), radius: 4)
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 0) {
                    HStack(spacing: 4) {
                        Image(systemName: "person.2.fill")
                            .font(.system(size: 9))
                        Text("\(post.currentParticipants.count)/\(post.maxParticipants)명")
                            .font(.system(size: 10, weight: .semibold))
                    }
                    .foregroundStyle(.white.opacity(0.9))

                    Spacer()

                }
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 28)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.12), radius: 12, y: 6)
    }
}

#Preview {
    ZStack {
        Color(.systemGroupedBackground).ignoresSafeArea()
        HStack(spacing: 12) {
            MeetingInfoBox(post: SampleDataSet.posts[0])
                .frame(width: 180, height: 240)
            MeetingInfoBox(post: SampleDataSet.posts[1])
                .frame(width: 180, height: 240)
        }
        .padding()
    }
}
